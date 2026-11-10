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