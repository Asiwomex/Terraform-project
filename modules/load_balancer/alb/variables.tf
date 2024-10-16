variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for the ALB"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port of the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol for the target group (HTTP, HTTPS)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the target group is located"
  type        = string
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
}

variable "health_check_interval" {
  description = "Interval between health checks (seconds)"
  type        = number
}

variable "health_check_timeout" {
  description = "Timeout for health checks (seconds)"
  type        = number
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold for health checks"
  type        = number
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for health checks"
  type        = number
}

variable "listener_port" {
  description = "Port for the ALB listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener (HTTP, HTTPS)"
  type        = string
  default     = "HTTP"
}
