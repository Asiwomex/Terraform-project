# Configure the AWS Provider
provider "aws" {
  region = "us-east-2" # Change to your desired AWS region
}

# Call VPC
module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  environment         = "dev"
  public_subnet_cidrs = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]
  availability_zones  = ["us-east-2a", "us-east-2b"] # Adjust based on your region
  enable_flow_logs    = false
}

# Call the Security Group module
module "security_group" {
  source             = "../../modules/security_group"
  vpc_id             = module.vpc.vpc_id
  security_group_name = "dev-security-group"
  environment        = var.environment  # Pass the environment variable
  ssh_cidr_blocks    = ["0.0.0.0/0"]   # Adjust based on your security requirements
  http_cidr_blocks   = ["0.0.0.0/0"]
  https_cidr_blocks  = ["0.0.0.0/0"]
  data_ports_cidr_blocks = ["0.0.0.0/0"]
}

# Call EC2
module "ubuntu_instance" {
  source           = "../../modules/ec2"
  ami              = "ami-0ea3c35c5c3284d82" # Replace with a valid Ubuntu LTS AMI ID
  instance_type    = "t2.micro"
  subnet_id        = module.vpc.public_subnet_ids[0]
  security_groups  = [module.security_group.security_group_id] # Reference the security group from the security_group module
  instance_name    = "dev-ubuntu-instance"
}

# Call the S3 module
module "s3_bucket" {
  source        = "../../modules/s3"
  bucket_name   = "asibucket"  # Change to a unique bucket name
  acl           = "private"     # Set the ACL as required
  environment   = "dev"         # Change to true if you want logging enabled
}

# Call the ALB module
module "alb" {
  source = "../../modules/load_balancer/alb"

  alb_name                  = "my-alb"
  security_groups           = [module.security_group.security_group_id] # Use the security group from the security_group module
  subnets                   = module.vpc.public_subnet_ids # Use public subnets created by the vpc module
  enable_deletion_protection = true
  environment               = "dev" # Directly using the value for simplicity
  target_group_name         = "my-alb-target-group"
  target_group_port         = 80
  target_group_protocol     = "HTTP"
  vpc_id                    = module.vpc.vpc_id # Get the VPC ID from the vpc module
  health_check_path         = "/health"
  health_check_interval     = 30
  health_check_timeout      = 5
  health_check_healthy_threshold   = 2
  health_check_unhealthy_threshold = 2
  listener_port             = 80  # Specify the listener port
  listener_protocol         = "HTTP"  # Specify the listener protocol
}

# Call the NLB module
module "nlb" {
  source = "../../modules/load_balancer/nlb"

  nlb_name                  = "my-nlb"
  security_groups           = [module.security_group.security_group_id] # Use the security group from the security_group module
  subnets                   = module.vpc.public_subnet_ids # Use public subnets created by the vpc module
  enable_deletion_protection = true
  environment               = "dev" # Directly using the value for simplicity
  target_group_name         = "my-nlb-target-group"
  target_group_port         = 80
  target_group_protocol     = "TCP"
  vpc_id                    = module.vpc.vpc_id # Get the VPC ID from the vpc module
  health_check_path         = "/health"
  health_check_interval     = 30
  health_check_timeout      = 5
  health_check_healthy_threshold   = 2
  health_check_unhealthy_threshold = 2
  listener_port             = 80  # Specify the listener port
  listener_protocol         = "TCP"  # Specify the listener protocol
}

# Call the Auto Scaling module
module "autoscaling" {
  source              = "../../modules/autoscaling"
  environment         = "dev"
  ami                 = "ami-0ea3c35c5c3284d82" # Replace with a valid Ubuntu LTS AMI ID
  instance_type       = "t2.micro"
  security_group_id   = module.security_group.security_group_id
  subnet_ids          = module.vpc.private_subnet_ids
  min_size            = 1
  max_size            = 3
  desired_capacity    = 1
  health_check_grace_period = 300
  termination_policies = ["OldestInstance"]
  scale_up_adjustment = 1
  scale_down_adjustment = -1
  cooldown            = 300
}


