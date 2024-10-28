# modules/cloudfront/variables.tf

variable "environment" {
  description = "The environment for the CloudFront distribution (e.g., dev, prod)"
  type        = string
}

variable "origin_domain_name" {
  description = "The domain name of the origin (e.g., S3 bucket name or custom origin)"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM SSL certificate for CloudFront"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket used as the origin for the CloudFront distribution"
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket used as the origin for the CloudFront distribution"
  type        = string
}
