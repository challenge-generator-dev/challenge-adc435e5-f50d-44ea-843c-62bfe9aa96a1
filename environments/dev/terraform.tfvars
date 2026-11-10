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