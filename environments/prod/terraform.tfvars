# Valores de variables para el ambiente de producción
# Configuración de alta disponibilidad y producción

project_name    = "notificaciones"
environment     = "prod"
region          = "us-east-1"

# Configuración de VPC con CIDR más amplio para producción
vpc_cidr              = "10.1.0.0/16"
public_subnet_cidrs   = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs  = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Configuración de compute con mayor capacidad para producción
instance_type     = "t3.small"
instance_count    = 3
ami_id            = "ami-0c55b159cbfafe1f0"
key_name          = "notificaciones-prod-key"

# Configuración de red con alta disponibilidad
enable_nat_gateway     = true
enable_vpn_gateway     = true
enable_dns_hostnames   = true
enable_dns_support     = true
single_nat_gateway     = false

# Configuración de seguridad más restrictiva para producción
allowed_ssh_cidr       = ["10.1.0.0/16"]
allowed_http_cidr      = ["10.0.0.0/8"]
allowed_https_cidr     = ["10.0.0.0/8"]
allowed_ssh_from_port  = 22
allowed_ssh_to_port    = 22
allowed_app_from_port  = 80
allowed_app_to_port    = 443

# Configuración de almacenamiento con mayor capacidad
root_volume_size = 50
root_volume_type = "gp3"

# Configuración de monitoreo completo para producción
enable_monitoring         = true
enable_detailed_monitoring = true
create_alarms             = true
alarm_cpu_threshold       = 80
alarm_memory_threshold    = 85

# Tags con información de producción
tags = {
  Environment = "production"
  Project     = "notificaciones"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Compliance  = "pci-dss"
  Backup      = "required"
}