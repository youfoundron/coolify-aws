# SSH Key to tunnel into server
variable "your_ssh_key" {
  description = "Your ssh key for tunneling into the EC2 instance"
  type        = string
}

variable "aws_region" {
  description = "AWS region to provision your resources in"
  type        = string
  default     = "us-east-1"
}

variable "coolify_server_instance_name" {
  description = "Value of the Name tag for the Coolify server's EC2 instance"
  type        = string
  default     = "CoolifyServer"
}
