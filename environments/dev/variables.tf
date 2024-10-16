variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  type        = string
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
  default     = "dev"  # Change as needed
}
