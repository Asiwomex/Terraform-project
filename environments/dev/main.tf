provider "aws" {
  region = "us-east-2" # Change to your desired AWS region
}

module "networking" {
  source              = "../../modules/networking"
  vpc_cidr            = "10.0.0.0/16"
  environment         = "dev"
  public_subnet_cidrs = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]
  availability_zones  = ["us-east-2a", "us-east-2b"] # Adjust based on your region
  enable_flow_logs    = false
}

module "ubuntu_instance" {
  source           = "../../modules/ec2"
  ami              = "ami-0ea3c35c5c3284d82" # Replace with a valid Ubuntu LTS AMI ID
  instance_type    = "t2.micro"
  subnet_id        = module.networking.public_subnet_ids[0]
  security_groups  = [module.networking.security_group_id] # Reference the security group from the networking module
  instance_name    = "dev-ubuntu-instance"
}
