variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"  # or set it according to your needs
}
