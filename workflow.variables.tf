# repo-root/variables.tf

variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-2"  # Set a default value, but it can be overridden
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"  # Set a default environment name
}

variable "project_name" {
  description = "The name of the project for tagging and naming resources"
  type        = string
  default     = "teraform-project"
}
