# repo-root/providers.tf

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # The AWS credentials will be picked up from the environment variables or through a credentials file.
  # This allows the same configuration to work across environments like local, CI/CD, etc.
}
