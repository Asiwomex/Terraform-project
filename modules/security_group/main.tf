resource "aws_security_group" "main" {
  name_prefix = var.security_group_name
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidr_blocks
    description = "HTTP access"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.https_cidr_blocks
    description = "HTTPS access"
  }

  # Example for additional data ports, adjust the port range or specifics as needed
  dynamic "ingress" {
    for_each = var.data_ports_cidr_blocks
    content {
      from_port   = 8080 # Replace with your specific data port or port range
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
      description = "Custom data port access"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name        = var.security_group_name
    Environment = var.environment
  }
}
