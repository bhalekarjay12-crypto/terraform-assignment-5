
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "EC2 public IP address"
  value       = aws_instance.app_server.public_ip
}

output "availability_zone" {
  description = "EC2 availability zone"
  value       = aws_instance.app_server.availability_zone
}
