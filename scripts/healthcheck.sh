#!/bin/bash

# =============================================================================
# Script de healthcheck para instancias del servicio de notificaciones
# Verifica el estado de las instancias EC2 y sus servicios asociados
# =============================================================================

set -euo pipefail

# Configuracion de colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables de configuracion
REGION="${AWS_REGION:-us-east-1}"
SERVICE_NAME="${SERVICE_NAME:-notificaciones}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
TIMEOUT="${HEALTHCHECK_TIMEOUT:-30}"
RETRY_ATTEMPTS="${HEALTHCHECK_RETRY:-3}"

# Archivo de log
LOG_FILE="/var/log/healthcheck.log"

# =============================================================================
# Funciones de utilidad
# =============================================================================

log() {
    local level="$1"
    local message="$2"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

log_info() {
    log "INFO" "$1"
}

log_warn() {
    log "WARN" "$1"
}

log_error() {
    log "ERROR" "$1"
}

# =============================================================================
# Verificacion de prerequisitos
# =============================================================================

check_prerequisites() {
    log_info "Verificando prerequisitos del sistema..."
    
    # Verificar que AWS CLI este instalado
    if ! command -v aws &> /dev/null; then
        log_error "AWS CLI no esta instalado"
        return 1
    fi
    
    # Verificar que jq este instalado
    if ! command -v jq &> /dev/null; then
        log_error "jq no esta instalado"
        return 1
    fi
    
    # Verificar credenciales de AWS
    if ! aws sts get-caller-identity &> /dev/null; then
        log_error "Credenciales de AWS no configuradas o invalidas"
        return 1
    fi
    
    log_info "Prerequisitos verificados correctamente"
    return 0
}

# =============================================================================
# Obtencion de instancias EC2
# =============================================================================

get_ec2_instances() {
    local instance_state="$1"
    
    log_info "Buscando instancias EC2 con tag Service=$SERVICE_NAME y Environment=$ENVIRONMENT..."
    
    local instances
    instances=$(aws ec2 describe-instances \
        --region "$REGION" \
        --filters "Name=tag:Service,Values=$SERVICE_NAME" \
                  "Name=tag:Environment,Values=$ENVIRONMENT" \
                  "Name=instance-state-name,Values=$instance_state" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text 2>/dev/null)
    
    if [[ -z "$instances" ]]; then
        log_warn "No se encontraron instancias en estado $instance_state"
        echo ""
        return 0
    fi
    
    echo "$instances"
}

# =============================================================================
# Verificacion de estado de instancia
# =============================================================================

check_instance_status() {
    local instance_id="$1"
    
    log_info "Verificando instancia: $instance_id"
    
    # Obtener estado de la instancia
    local instance_state
    instance_state=$(aws ec2 describe-instances \
        --region "$REGION" \
        --instance-ids "$instance_id" \
        --query 'Reservations[].Instances[].State.Name' \
        --output text 2>/dev/null)
    
    if [[ "$instance_state" != "running" ]]; then
        log_error "Instancia $instance_id no esta en estado running (estado actual: $instance_state)"
        return 1
    fi
    
    # Obtener estado del sistema
    local system_status
    system_status=$(aws ec2 describe-instance-status \
        --region "$REGION" \
        --instance-ids "$instance_id" \
        --query 'InstanceStatuses[].SystemStatus.Status' \
        --output text 2>/dev/null)
    
    if [[ "$system_status" != "ok" ]]; then
        log_error "Sistema de instancia $instance_id no esta OK (estado: $system_status)"
        return 1
    fi
    
    # Obtener estado de la instancia (checks)
    local instance_status
    instance_status=$(aws ec2 describe-instance-status \
        --region "$REGION" \
        --instance-ids "$instance_id" \
        --query 'InstanceStatuses[].InstanceStatus.Status' \
        --output text 2>/dev/null)
    
    if [[ "$instance_status" != "ok" ]]; then
        log_error "Estado de instancia $instance_id no esta OK (estado: $instance_status)"
        return 1
    fi
    
    log_info "Instancia $instance_id verificada: estado=$instance_state, sistema=$system_status, instancia=$instance_status"
    return 0
}

# =============================================================================
# Verificacion de servicios internos via SSM
# =============================================================================

check_instance_services_via_ssm() {
    local instance_id="$1"
    
    log_info "Verificando servicios en instancia $instance_id via SSM..."
    
    # Verificar que SSM agent este disponible
    local ssm_status
    ssm_status=$(aws ssm describe-instance-information \
        --region "$REGION" \
        --filters "Key=InstanceIds,Values=$instance_id" \
        --query 'InstanceInformationList[0].PingStatus' \
        --output text 2>/dev/null || echo "Offline")
    
    if [[ "$ssm_status" != "Online" ]]; then
        log_warn "SSM agent no esta Online en instancia $instance_id (estado: $ssm_status)"
        return 1
    fi
    
    # Verificar servicio de notificaciones usando SSM Run Command
    local service_check
    service_check=$(aws ssm send-command \
        --region "$REGION" \
        --instance-ids "$instance_id" \
        --document-name "AWS-RunShellScript" \
        --parameters '{"commands":["systemctl is-active notificaciones-service"]}' \
        --timeout-seconds "$TIMEOUT" \
        --query 'Command.CommandId' \
        --output text 2>/dev/null)
    
    if [[ -z "$service_check" ]]; then
        log_error "No se pudo ejecutar comando en instancia $instance_id"
        return 1
    fi
    
    # Esperar resultado del comando
    sleep 5
    
    local command_output
    command_output=$(aws ssm get-command-invocation \
        --region "$REGION" \
        --command-id "$service_check" \
        --instance-id "$instance_id" \
        --query 'StandardOutputContent' \
        --output text 2>/dev/null || echo "ERROR")
    
    if [[ "$command_output" == "active" ]]; then
        log_info "Servicio de notificaciones activo en $instance_id"
        return 0
    else
        log_warn "Servicio de notificaciones en $instance_id: $command_output"
        return 1
    fi
}

# =============================================================================
# Verificacion de conectividad
# =============================================================================

check_connectivity() {
    local instance_id="$1"
    
    log_info "Verificando conectividad a instancia $instance_id..."
    
    # Obtener IP publica o privada
    local instance_ip
    instance_ip=$(aws ec2 describe-instances \
        --region "$REGION" \
        --instance-ids "$instance_id" \
        --query 'Reservations[].Instances[].PrivateIpAddress' \
        --output text 2>/dev/null)
    
    # Verificar conectividad SSH
    if timeout 5 bash -c "nc -z $instance_ip 22 2>/dev/null"; then
        log_info "Conectividad SSH ok en $instance_ip"
    else
        log_warn "No se pudo conectar via SSH a $instance_ip"
    fi
    
    # Verificar puertos de aplicacion (8080 para API, 5432 para DB, etc.)
    local ports=(8080 5432 6379)
    for port in "${ports[@]}"; do
        if timeout 3 bash -c "nc -z $instance_ip $port 2>/dev/null"; then
            log_info "Puerto $port abierto en $instance_ip"
        fi
    done
    
    return 0
}

# =============================================================================
# Healthcheck principal
# =============================================================================

run_healthcheck() {
    local exit_code=0
    local instances_running
    
    log_info "=========================================="
    log_info "Iniciando healthcheck del servicio: $SERVICE_NAME"
    log_info "Ambiente: $ENVIRONMENT"
    log_info "Region: $REGION"
    log_info "=========================================="
    
    # Verificar prerequisitos
    if ! check_prerequisites; then
        log_error "Fallo en verificacion de prerequisitos"
        exit 1
    fi
    
    # Obtener instancias en estado running
    instances_running=$(get_ec2_instances "running")
    
    if [[ -z "$instances_running" ]]; then
        log_error "No hay instancias en estado running para el servicio $SERVICE_NAME"
        exit 1
    fi
    
    # Contadores
    local total_instances=0
    local healthy_instances=0
    local unhealthy_instances=0
    
    # Verificar cada instancia
    for instance_id in $instances_running; do
        ((total_instances++))
        
        local instance_healthy=true
        
        # Verificar estado de EC2
        if ! check_instance_status "$instance_id"; then
            instance_healthy=false
        fi
        
        # Verificar servicios via SSM
        if ! check_instance_services_via_ssm "$instance_id"; then
            instance_healthy=false
        fi
        
        # Verificar conectividad
        if ! check_connectivity "$instance_id"; then
            instance_healthy=false
        fi
        
        if $instance_healthy; then
            ((healthy_instances++))
            echo -e "${GREEN}[OK]${NC} Instancia $instance_id saludable"
        else
            ((unhealthy_instances++))
            echo -e "${RED}[FAIL]${NC} Instancia $instance_id no saludable"
            exit_code=1
        fi
    done
    
    # Resumen
    log_info "=========================================="
    log_info "RESUMEN DEL HEALTHCHECK"
    log_info "=========================================="
    log_info "Total de instancias: $total_instances"
    log_info "Instancias saludables: $healthy_instances"
    log_info "Instancias no saludables: $unhealthy_instances"
    
    if [[ $exit_code -eq 0 ]]; then
        echo -e "${GREEN}Healthcheck PASADO${NC}"
    else
        echo -e "${RED}Healthcheck FALLIDO${NC}"
    fi
    
    return $exit_code
}

# =============================================================================
# Retry logic para healthcheck
# =============================================================================

run_with_retry() {
    local attempt=1
    local success=false
    
    while [[ $attempt -le $RETRY_ATTEMPTS ]]; do
        log_info "Intento $attempt de $RETRY_ATTEMPTS"
        
        if run_healthcheck; then
            success=true
            break
        fi
        
        if [[ $attempt -lt $RETRY_ATTEMPTS ]]; then
            log_warn "Healthcheck fallido, esperando antes de reintentar..."
            sleep 10
        fi
        
        ((attempt++))
    done
    
    if $success; then
        log_info "Healthcheck exitoso despues de $attempt intento(s)"
        return 0
    else
        log_error "Healthcheck fallido despues de $RETRY_ATTEMPTS intentos"
        return 1
    fi
}

# =============================================================================
# Punto de entrada
# =============================================================================

main() {
    # Crear log si no existe
    if [[ ! -f "$LOG_FILE" ]]; then
        touch "$LOG_FILE" 2>/dev/null || LOG_FILE="/tmp/healthcheck.log"
    fi
    
    # Ejecutar con reintentos
    run_with_retry
}

# Ejecutar main si el script es llamado directamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi