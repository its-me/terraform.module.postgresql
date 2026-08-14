output "instance_id" {
  description = "ID of the shared Cloud SQL instance."
  value       = local.instance_id
}

output "instance_name" {
  description = "Name of the shared Cloud SQL instance."
  value       = local.instance_name
}

output "instance_connection_name" {
  description = "Cloud SQL instance connection name."
  value       = local.instance_connection_name
}

output "instance_private_ip" {
  description = "Private IP address of the Cloud SQL instance."
  value       = local.instance_private_ip
}

output "instance_self_link" {
  description = "Self link of the shared Cloud SQL instance."
  value       = local.instance_self_link
}
