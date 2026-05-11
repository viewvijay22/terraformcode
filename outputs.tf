output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "instance_state" {
  description = "Current state of the EC2 instance"
  value       = aws_instance.example.instance_state
}
