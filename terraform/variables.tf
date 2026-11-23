variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "travelmemory"
}

variable "my_ip" {
  description = "Your public IP address allowed for SSH"
  type        = string
  default     = "49.43.25.252/32"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "C:/Users/DELL/.ssh/travelmemory-key.pub"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
