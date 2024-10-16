variable "nlb_name" {
  description = "Name of the Network Load Balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs to associate with the NLB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs for the NLB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for the NLB"
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
  description = "Protocol for the target group (TCP)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the target group is located"
  type        = string
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
  default     = "/"
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
  description = "Port for the NLB listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the NLB listener (TCP)"
  type        = string
  default     = "TCP"
}
