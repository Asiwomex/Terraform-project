variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed to access SSH (port 22)"
  type        = list(string)
}

variable "http_cidr_blocks" {
  description = "CIDR blocks allowed to access HTTP (port 80)"
  type        = list(string)
}

variable "https_cidr_blocks" {
  description = "CIDR blocks allowed to access HTTPS (port 443)"
  type        = list(string)
}

variable "data_ports_cidr_blocks" {
  description = "CIDR blocks allowed to access data ports (custom ports)"
  type        = list(string)
  default     = [] # Provide default if needed
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string # Change as needed
}
