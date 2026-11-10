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