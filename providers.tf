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