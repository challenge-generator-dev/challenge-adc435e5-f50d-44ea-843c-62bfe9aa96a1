# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109193147506), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versión la infraestructura del servicio de notificaciones con Terraform
- Tiempo estimado: 4 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configurar el entorno de Terraform — objetivo: Preparar el entorno para el despliegue de la infraestructura con Terraform — entregable (NO resolver): Entorno de Terraform configurado y listo para el despliegue.
- Fase 2: Desplegar la red con Terraform — objetivo: Crear y desplegar la red del servicio de notificaciones utilizando Terraform — entregable (NO resolver): Red del servicio de notificaciones desplegada y verificada.
- Fase 3: Desplegar los recursos de computación con Terraform — objetivo: Crear y desplegar los recursos de computación para el servicio de notificaciones utilizando Terraform — entregable (NO resolver): Recursos de computación del servicio de notificaciones desplegados y versionados.
- Fase 4: Validar y documentar el despliegue — objetivo: Validar el despliegue completo de la infraestructura y documentar el proceso — entregable (NO resolver): Informe detallado del despliegue validado y documentado.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: providers.tf ===
# Configuración de variables globales para el proveedor AWS
# Este archivo define las variables requeridas por el proveedor y validaciones de entorno
# para el despliegue de la infraestructura del servicio de notificaciones.

# Variables globales requeridas por el proveedor
variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# Validación de variables de entorno
locals {
  valid_environments = ["dev", "staging", "prod"]
  environment_validation = contains(local.valid_environments, var.environment) ? var.environment : "dev"
}

# Tags comunes para todos los recursos
locals {
  common_tags = {
    Environment = var.environment
    Project     = "notifications-service"
    ManagedBy   = "Terraform"
    Region      = var.aws_region
  }
}

# Configuración de nombres de recursos con convenciones del proyecto
locals {
  resource_prefix = "notif-${var.environment}"
  vpc_cidr        = var.environment == "prod" ? "10.0.0.0/16" : (var.environment == "staging" ? "10.1.0.0/16" : "10.2.0.0/16")
}

// === ARCHIVO: variables.tf ===
# Definición de variables globales utilizadas en la infraestructura
# Estas variables servirán como superficie de práctica para que el participante
# complete los valores según los requisitos del dominio de notificaciones.

variable "project_name" {
  description = "Nombre del proyecto para prefijar recursos"
  type        = string
  default     = "notifications-service"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC principal"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para los servidores de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "min_instance_size" {
  description = "Número mínimo de instancias en el grupo de autoescalado"
  type        = number
  default     = 2
}

variable "max_instance_size" {
  description = "Número máximo de instancias en el grupo de autoescalado"
  type        = number
  default     = 4
}

variable "desired_instance_size" {
  description = "Número deseado de instancias en el grupo de autoescalado"
  type        = number
  default     = 2
}

variable "health_check_path" {
  description = "Ruta para el health check de las instancias"
  type        = string
  default     = "/health"
}

// === ARCHIVO: modules/network/variables.tf ===
# Variables específicas del módulo de red
# Superficie de práctica para que el participante complete la configuración
# de red según los requisitos del servicio de notificaciones.

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para distribuir subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un único NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

variable "project_name" {
  description = "Nombre del proyecto para prefijar recursos"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

// === ARCHIVO: modules/compute/variables.tf ===
# Variables específicas del módulo de computación
# Superficie de práctica para que el participante configure los recursos
# de computación según los requisitos del servicio de notificaciones.

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "min_instance_size" {
  description = "Número mínimo de instancias en el grupo de autoescalado"
  type        = number
}

variable "max_instance_size" {
  description = "Número máximo de instancias en el grupo de autoescalado"
  type        = number
}

variable "desired_instance_size" {
  description = "Número deseado de instancias en el grupo de autoescalado"
  type        = number
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegarán las instancias"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes para el grupo de autoescalado"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de IDs de grupos de seguridad para las instancias"
  type        = list(string)
}

variable "ami_id" {
  description = "ID de la AMI para las instancias"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
}

variable "health_check_path" {
  description = "Ruta para el health check de las instancias"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto para prefijar recursos"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

// === ARCHIVO: outputs.tf ===
# Outputs de Terraform para el servicio de notificaciones
# Superficie de práctica: el estudiante debe completar con los outputs necesarios

output "vpc_id" {
  description = "ID de la VPC principal"
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "instance_ids" {
  description = "IDs de las instancias de computación"
  value       = module.compute.instance_ids
}

output "instance_ips" {
  description = "IPs privadas de las instancias"
  value       = module.compute.instance_ips
}

// === ARCHIVO: main.tf ===
# Orquestación principal de módulos para el servicio de notificaciones
# Superficie de práctica: el estudiante debe ajustar según necesidades

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

module "network" {
  source = "./modules/network"

  environment           = var.environment
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnets_cidr   = var.public_subnets_cidr
  private_subnets_cidr  = var.private_subnets_cidr
}

module "compute" {
  source = "./modules/compute"

  environment            = var.environment
  project_name           = var.project_name
  vpc_id                 = module.network.vpc_id
  subnet_ids             = module.network.private_subnet_ids
  instance_type          = var.instance_type
  ami_id                 = var.ami_id
  key_name               = var.key_name
  security_group_ids     = [module.network.security_group_id]
  min_instance_size      = var.min_instance_size
  desired_instance_size  = var.desired_instance_size
  max_instance_size      = var.max_instance_size
}

// === ARCHIVO: README.md ===
# Infraestructura del Servicio de Notificaciones con Terraform

Este proyecto contiene la definición de infraestructura como código para el servicio de notificaciones, utilizando Terraform con el proveedor de AWS. La arquitectura se basa en módulos reutilizables que separan la configuración de red y computación.

## Arquitectura

La infraestructura se компоненты en dos módulos principales:

- **Módulo de Red (`modules/network`)**: Proporciona la VPC con subredes públicas y privadas, tablas de enrutamiento y grupos de seguridad.
- **Módulo de Computación (`modules/compute`)**: Despliega las instancias de servidores para procesar las notificaciones.

## Estructura del Proyecto

```
.
├── main.tf                 # Orquestación de módulos
├── providers.tf            # Configuración de proveedores
├── variables.tf            # Definición de variables
├── outputs.tf              # Outputs del proyecto
├── modules/
│   ├── network/            # Módulo de infraestructura de red
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── compute/            # Módulo de recursos de computación
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/                # Configuración para desarrollo
│   │   └── terraform.tfvars
│   └── prod/               # Configuración para producción
│       └── terraform.tfvars
└── scripts/
    └── healthcheck.sh      # Script de verificación de salud
```

## Requisitos Previos

Para trabajar con este proyecto necesitas instalar las siguientes herramientas en tu máquina local:

1. **Terraform** (versión 1.5 o superior): Utilizado para definir y gestionar la infraestructura.
2. **AWS CLI** (configurada con credenciales válidas): Necesaria para autenticarse con AWS.
3. **Git**: Para clonar y gestionar el repositorio de código.

## Configuración Inicial

### 1. Configurar Credenciales de AWS

Asegúrate de tener configuradas tus credenciales de AWS mediante variables de entorno o el archivo de configuración de AWS CLI. El método recomendado es usar variables de entorno:

```bash
export AWS_ACCESS_KEY_ID="tu_access_key"
export AWS_SECRET_ACCESS_KEY="tu_secret_key"
export AWS_DEFAULT_REGION="us-east-1"
```

### 2. Inicializar Terraform

Desde la raíz del proyecto, ejecuta el comando de inicialización para descargar los proveedores necesarios:

```bash
terraform init
```

Este comando configurará el backend remoto (S3) y descargará el proveedor de AWS especificado en la configuración.

### 3. Seleccionar el Ambiente

Editable el archivo de variables correspondiente al ambiente donde deseas desplegar:

- **Desarrollo**: Edita `environments/dev/terraform.tfvars`.
- **Producción**: Edita `environments/prod/terraform.tfvars`.

Alternatively, puedes especificar el archivo de variables al ejecutar los comandos de Terraform mediante la bandera `-var-file`.

## Comandos de Despliegue

### Validar la Configuración

Antes de aplicar cualquier cambio, valida que la configuración de Terraform sea correcta:

```bash
terraform validate
```

### Planificar Cambios

Para ver los cambios que se aplicarán sin ejecutarlos, utiliza el comando plan:

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

Este comando mostrará un resumen de los recursos que se crearán, modificarán o destruirán.

### Aplicar Cambios

Para aplicar los cambios planificados, ejecuta:

```bash
terraform apply -var-file=environments/dev/terraform.tfvars
```

Terraform mostrará nuevamente el plan y solicitará confirmación. Escribe `yes` para continuar con el despliegue.

### Destruir Infraestructura

Para eliminar todos los recursos creados, utiliza el comando destroy:

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

**Advertencia**: Este comando eliminará todos los recursos de AWS creados por este proyecto. Úsalo con precaución.

## Verificación del Despliegue

Después de aplicar los cambios, puedes verificar que la infraestructura esté funcionando correctamente ejecutando el script de healthcheck:

```bash
bash scripts/healthcheck.sh
```

El script verificará que los recursos de red y computación estén accesibles y respondiendo correctamente.

## Variables Principales

| Variable | Descripción | Valor Predeterminado |
|----------|-------------|---------------------|
| `aws_region` | Región de AWS donde se desplegará la infraestructura | `us-east-1` |
| `project_name` | Nombre del proyecto para etiquetado | `notificaciones` |
| `environment` | Ambiente de despliegue (dev, prod) | `dev` |
| `vpc_cidr` | Bloque CIDR para la VPC | `10.0.0.0/16` |
| `instance_type` | Tipo de instancia EC2 | `t3.medium` |
| `instance_count` | Número de instancias a desplegar | `2` |

## Estados Remotos

Este proyecto utiliza un backend remoto con S3 para almacenar el estado de Terraform y DynamoDB para el bloqueo de estados concurrentes. La configuración del backend está definida en `providers.tf`.

## Buenas Prácticas

1. **Nunca guardes secretos en el repositorio**: Utiliza variables de entorno o AWS Secrets Manager para gestionar credenciales sensibles.
2. **Usatfvars por ambiente**: Mantén configuraciones separadas para desarrollo y producción.
3. **Revisa el plan antes de aplicar**: Siempre ejecuta `terraform plan` antes de `terraform apply`.
4. **Versiona tu infraestructura**: Los cambios de infraestructura deben pasar por el mismo flujo de revisión de código que el resto del proyecto.

## Troubleshooting

### Error de Autenticación

Si recibes errores de autenticación, verifica que tus credenciales de AWS estén correctamente configuradas y que el usuario tenga los permisos necesarios para crear los recursos.

### Error de Estado Bloqueado

Si el estado está bloqueado, verifica que no haya otra sesión de Terraform ejecutándose. El bloqueo se libera automáticamente después de un timeout.

### Error de Dependencias Circulares

Si detectas dependencias circulares entre módulos, revisa la configuración de outputs y variables para asegurar que los valores fluyan correctamente sin crear ciclos.

// === ARCHIVO: modules/network/main.tf ===
# Módulo de red para el servicio de notificaciones
# Este archivo contiene la definición de VPC, subredes y grupos de seguridad

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "${var.project_name}-${var.environment}-vpc"
    Environment = var.environment
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-igw"
    Environment = var.environment
  }
}

# Subredes públicas
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "public"
  }
}

# Subredes privadas
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name        = "${var.project_name}-${var.environment}-private-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "private"
  }
}

# Tablas de enrutamiento para subredes públicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-public-rt"
    Environment = var.environment
  }
}

# Asociación de tabla de ruta pública
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Grupo de seguridad para el servicio de notificaciones
resource "aws_security_group" "notification_sg" {
  name        = "${var.project_name}-${var.environment}-notification-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Salida completa"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-sg"
    Environment = var.environment
  }
}

// === ARCHIVO: modules/network/outputs.tf ===
# Outputs del módulo de red
# Proporciona los valores necesarios para otros módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

output "security_group_id" {
  description = "ID del grupo de seguridad del servicio"
  value       = aws_security_group.notification_sg.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de compute para el servicio de notificaciones
# Define instancias EC2, launch templates, IPs elásticas y volúmenes EBS

# Datos de AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Instancias EC2 para el servicio de notificaciones
resource "aws_instance" "notification_server" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [var.security_group_id]
  user_data              = <<-EOF
#!/bin/bash
apt-get update
apt-get install -y docker.io docker-compose
systemctl start docker
systemctl enable docker
EOF

  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-${count.index + 1}"
    Environment = var.environment
    Role        = "notification-server"
  }
}

# Elastic IP para instancia primaria
resource "aws_eip" "notification" {
  count  = var.assign_eip ? 1 : 0
  domain = "vpc"
  instance = aws_instance.notification_server[0].id
  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-eip"
    Environment = var.environment
  }
}

# Auto Scaling Group (opcional, preparado para escalamiento)
resource "aws_launch_template" "notification_lt" {
  name_prefix   = "${var.project_name}-${var.environment}-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = base64encode(<<-EOF
#!/bin/bash
apt-get update
apt-get install -y docker.io docker-compose
systemctl start docker
systemctl enable docker
EOF
)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-${var.environment}-notification"
      Environment = var.environment
      Role        = "notification-server"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Volumen EBS adicional para datos
resource "aws_ebs_volume" "notification_data" {
  count             = var.instance_count
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  encrypted         = var.ebs_encrypted

  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-data-${count.index + 1}"
    Environment = var.environment
  }
}

# Asociación de volumen EBS
resource "aws_volume_attachment" "notification_data" {
  count       = var.instance_count
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.notification_data[count.index].id
  instance_id = aws_instance.notification_server[count.index].id
}

// === ARCHIVO: modules/compute/outputs.tf ===
# Outputs del módulo de computación
# Superficie de práctica: completar con las referencias a los recursos creados

output "instance_ids" {
  description = "IDs de las instancias de computo desplegadas"
  # TODO: Referenciar el recurso de instancia
  value       = []
}

output "security_group_id" {
  description = "ID del grupo de seguridad para compute"
  # TODO: Referenciar el recurso de grupo de seguridad
  value       = ""
}

output "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  # TODO: Referenciar el recurso de perfil IAM
  value       = ""
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias"
  # TODO: Iterar sobre las instancias para obtener IPs privadas
  value       = []
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
# Valores de variables para el ambiente de desarrollo
# Configuración ligera para pruebas y desarrollo

project_name    = "notificaciones"
environment     = "dev"
region          = "us-east-1"

# Configuración de VPC
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# Configuración de compute
instance_type     = "t3.micro"
instance_count    = 1
ami_id            = "ami-0c55b159cbfafe1f0"
key_name          = "notificaciones-dev-key"

# Configuración de red
enable_nat_gateway     = true
enable_vpn_gateway     = false
enable_dns_hostnames   = true
enable_dns_support     = true

# Configuración de seguridad
allowed_ssh_cidr       = ["10.0.0.0/16"]
allowed_http_cidr      = ["0.0.0.0/0"]
allowed_https_cidr     = ["0.0.0.0/0"]
allowed_ssh_from_port  = 22
allowed_ssh_to_port    = 22
allowed_app_from_port  = 80
allowed_app_to_port    = 443

# Configuración de almacenamiento
root_volume_size = 20
root_volume_type = "gp3"

# Configuración de monitoreo
enable_monitoring       = true
enable_detailed_monitoring = false
create_alarms           = false

# Tags
tags = {
  Environment = "development"
  Project     = "notificaciones"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
}

// === ARCHIVO: environments/prod/terraform.tfvars ===
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

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: Dockerfile ===
# Dockerfile multi-stage para el servicio de notificaciones
# Etapa de build: compila la aplicación
# Etapa final: imagen optimizada con solo los artefactos necesarios

FROM python:3.11-slim AS builder

WORKDIR /build

# Instalar dependencias de build
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos de dependencias
COPY requirements.txt .

# Instalar dependencias en entorno virtual
RUN python -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

# Copiar código fuente
COPY src/ ./src/

# Etapa de producción
FROM python:3.11-slim AS production

WORKDIR /app

# Crear usuario no root para seguridad
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Copiar únicamente el entorno virtual de la etapa builder
COPY --from=builder /venv /venv

# Copiar código de la aplicación
COPY --from=builder /build/src ./src

# Configurar entorno virtual
ENV PATH="/venv/bin:$PATH" \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Exponer puerto de la aplicación
EXPOSE 8080

# Cambiar a usuario no root
USER appuser

# Healthcheck para verificar que la aplicación está funcionando
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8080/health') || exit(1)" || exit 1

# Comando de inicio
CMD ["python", "-m", "src.main"]
```
