variable "environment" {}
variable "ami" {}
variable "instance_type" {}
variable "security_group_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "min_size" {
  default = 1
}
variable "max_size" {
  default = 3
}
variable "desired_capacity" {
  default = 1
}
variable "health_check_grace_period" {
  default = 300
}
variable "termination_policies" {
  type    = list(string)
  default = ["OldestInstance"]
}
variable "scale_up_adjustment" {
  default = 1
}
variable "scale_down_adjustment" {
  default = -1
}
variable "cooldown" {
  default = 300
}
