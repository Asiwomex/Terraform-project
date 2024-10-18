output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "launch_configuration_id" {
  value = aws_launch_configuration.asg_launch_config.id
}
