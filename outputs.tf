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