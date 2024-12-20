# Configure the AWS Provider
provider "aws" {
  region = "us-east-2" # Change to your desired AWS region
}


# # Call VPC module

# module "vpc" {
#   source              = "../../modules/vpc"
#   vpc_cidr            = "10.0.0.0/16"
#   environment         = var.environment
#   public_subnet_cidrs = ["10.0.1.0/24"]
#   private_subnet_cidrs = ["10.0.2.0/24"]
#   availability_zones  = ["us-east-2a", "us-east-2b"] # Adjust based on your region
#   enable_flow_logs    = false
# }


# # Call the Security Group module

# module "security_group" {
#   source              = "../../modules/security_group"
#   vpc_id             = module.vpc.vpc_id  # Reference the VPC ID from the VPC module
#   security_group_name = "dev-security-group"
#   environment        = var.environment
#   ssh_cidr_blocks    = ["0.0.0.0/0"]   # Adjust based on your security requirements
#   http_cidr_blocks   = ["0.0.0.0/0"]
#   https_cidr_blocks  = ["0.0.0.0/0"]
#   data_ports_cidr_blocks = ["0.0.0.0/0"]
# }


# # Call EC2

# module "ubuntu_instance" {
#   source           = "../../modules/ec2"
#   ami              = "ami-0ea3c35c5c3284d82" # Replace with a valid Ubuntu LTS AMI ID
#   instance_type    = "t2.micro"
#   subnet_id        = module.vpc.public_subnet_ids[0]
#   security_groups  = [module.security_group.security_group_id] # Reference the security group from the security_group module
#   instance_name    = "dev-ubuntu-instance"
# }


# Call the S3 module

module "s3_bucket" {
  source        = "../../modules/s3"
  bucket_name   = "avudzigborgborvor"  # Change to a unique bucket name
  acl           = "private"     # Set the ACL as required
  environment   = "dev"         # Change to true if you want logging enabled
}



# # Call the ALB module

# module "alb" {
#   source = "../../modules/load_balancer/alb"

#   alb_name                  = "my-alb"
#   security_groups           = [module.security_group.security_group_id] # Use the security group from the security_group module
#   subnets                   = module.vpc.public_subnet_ids # Use public subnets created by the vpc module
#   enable_deletion_protection = true
#   environment               = "dev" # Directly using the value for simplicity
#   target_group_name         = "my-alb-target-group"
#   target_group_port         = 80
#   target_group_protocol     = "HTTP"
#   vpc_id                    = module.vpc.vpc_id # Get the VPC ID from the vpc module
#   health_check_path         = "/health"
#   health_check_interval     = 30
#   health_check_timeout      = 5
#   health_check_healthy_threshold   = 2
#   health_check_unhealthy_threshold = 2
#   listener_port             = 80  # Specify the listener port
#   listener_protocol         = "HTTP"  # Specify the listener protocol
# }


# # Call the NLB module

# module "nlb" {
#   source = "../../modules/load_balancer/nlb"

#   nlb_name                  = "my-nlb"
#   security_groups           = [module.security_group.security_group_id] # Use the security group from the security_group module
#   subnets                   = module.vpc.public_subnet_ids # Use public subnets created by the vpc module
#   enable_deletion_protection = true
#   environment               = "dev" # Directly using the value for simplicity
#   target_group_name         = "my-nlb-target-group"
#   target_group_port         = 80
#   target_group_protocol     = "TCP"
#   vpc_id                    = module.vpc.vpc_id # Get the VPC ID from the vpc module
#   health_check_path         = "/health"
#   health_check_interval     = 30
#   health_check_timeout      = 5
#   health_check_healthy_threshold   = 2
#   health_check_unhealthy_threshold = 2
#   listener_port             = 80  # Specify the listener port
#   listener_protocol         = "TCP"  # Specify the listener protocol
# }


# # Call the Autoscaling module

# module "autoscaling" {
#   source              = "../../modules/autoscaling"
#   environment         = "dev"
#   ami                 = "ami-0ea3c35c5c3284d82" # Replace with a valid Ubuntu LTS AMI ID
#   instance_type       = "t2.micro"
#   security_group_id   = module.security_group.security_group_id
#   subnet_ids          = module.vpc.private_subnet_ids
#   vpc_id              = module.vpc.vpc_id    # Correctly referencing the VPC ID output
#   min_size            = 1
#   max_size            = 3
#   desired_capacity    = 1
#   health_check_grace_period = 300
#   termination_policies = ["OldestInstance"]
#   scale_up_adjustment = 1
#   scale_down_adjustment = -1
#   cooldown            = 300
# }


# # Call the CloudFront module
# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "${var.environment}-my-bucket"
  
#   tags = {
#     Name        = "${var.environment}-bucket"
#     Environment = var.environment
#   }
# }
# module "cloudfront" {
#   source              = "../../modules/cloudfront"
#   environment         = var.environment
#   origin_domain_name  = aws_s3_bucket.my_bucket.bucket_regional_domain_name  # Replace with your S3 bucket's domain
#   acm_certificate_arn = "arn:aws:acm:region:account-id:certificate/certificate-id"  # Replace with your certificate ARN
#   s3_bucket_name      = aws_s3_bucket.my_bucket.bucket
#   s3_bucket_arn       = aws_s3_bucket.my_bucket.arn
# }

