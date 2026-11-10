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