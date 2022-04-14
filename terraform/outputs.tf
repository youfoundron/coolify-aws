# Resources outputs
output "coolify_server_instance_id" {
  description = "ID of the Coolify server's EC2 instance"
  value       = aws_instance.coolify_server.id
}

output "coolify_server_instance_public_ip" {
  description = "Public IP address of the Coolify server's EC2 instance"
  value       = aws_instance.coolify_server.public_ip
}

output "coolify_server_instance_public_dns" {
  description = "Public DNS of the Coolify server's EC2 instance"
  value       = aws_instance.coolify_server.public_dns
}
