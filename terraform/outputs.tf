output "web_server_public_ip" {
  description = "Public IP address of TravelMemory web server"
  value       = aws_instance.web.public_ip
}

output "web_server_public_dns" {
  description = "Public DNS name of TravelMemory web server"
  value       = aws_instance.web.public_dns
}

output "database_private_ip" {
  description = "Private IP address of MongoDB server"
  value       = aws_instance.database.private_ip
}

output "vpc_id" {
  description = "ID of the TravelMemory VPC"
  value       = aws_vpc.main.id
}
