# Terraform-project


This project, `terraform-project`, is designed to manage and deploy infrastructure using Terraform. The project is organized into environments and modules, making it reusable, maintainable, and scalable. Below is the structure and description of each component in the project.

## Project Structure

The project structure is exactly as seen in the project, haha, funny

terraform-project/
├── environments/
│   └── dev/
│       ├── main.tf
│       └── variables.tf
└── modules/
    ├── autoscaling/
    ├── ec2/
    ├── load_balancer/
    │   ├── alb/
    │   └── nlb/
    ├── s3/
    ├── security_groups/
    └── vpc/

*All models have their main.tf, outputs.tf and variables.tf defined in them*

## Environments

- **dev**: The development environment is located in `environments/dev`. The `main.tf` file in this directory calls all modules defined in the `modules` directory to set up the infrastructure. The `variables.tf` file contains environment-specific variables.

## Modules

The `modules` directory contains reusable infrastructure modules that are used to create and manage various AWS resources. Each module has its own `main.tf`, `variables.tf`, and `outputs.tf` files.

### 1. Autoscaling

- **Purpose**: Manages the setup of an Auto Scaling Group (ASG) for EC2 instances.
- **Files**:
  - `main.tf`: Defines the ASG, scaling policies, and launch configurations.
  - `variables.tf`: Contains inputs for configuring ASG properties such as instance type, scaling policies, and more.
  - `outputs.tf`: Exports essential information like the ASG name and its configuration.

### 2. EC2

- **Purpose**: Provisions EC2 instances based on specified AMIs and instance types.
- **Files**:
  - `main.tf`: Defines the EC2 instance configuration.
  - `variables.tf`: Contains variables like instance type, AMI ID, and security group.
  - `outputs.tf`: Exports the instance ID, IP address, and other key details.

### 3. Load Balancer

- **alb (Application Load Balancer)**:
  - **Purpose**: Sets up an ALB for routing traffic to application servers.
  - **Files**:
    - `main.tf`: Configures the ALB, target groups, and listeners.
    - `variables.tf`: Holds configuration options like listener ports and target group settings.
    - `outputs.tf`: Outputs ALB information such as DNS name and ARN.
    
- **nlb (Network Load Balancer)**:
  - **Purpose**: Sets up an NLB for routing traffic based on low-latency needs.
  - **Files**:
    - `main.tf`: Configures the NLB, target groups, and listeners.
    - `variables.tf`: Holds NLB configuration options like ports and protocols.
    - `outputs.tf`: Outputs NLB details such as DNS name and ARN.

### 4. S3

- **Purpose**: Manages S3 buckets for storage solutions.
- **Files**:
  - `main.tf`: Configures the S3 bucket and its properties.
  - `variables.tf`: Contains input variables for S3 settings such as bucket name and access control.
  - `outputs.tf`: Provides details like the bucket name and ARN.

### 5. Security Groups

- **Purpose**: Manages security groups for controlling inbound and outbound traffic.
- **Files**:
  - `main.tf`: Configures rules for SSH, HTTP, HTTPS, and other custom ports.
  - `variables.tf`: Contains variables for allowed CIDR ranges and port definitions.
  - `outputs.tf`: Outputs security group IDs and rules.

### 6. VPC

- **Purpose**: Manages the creation and configuration of a VPC, including subnets, route tables, and internet gateways.
- **Files**:
  - `main.tf`: Defines the VPC and its components.
  - `variables.tf`: Contains input variables like CIDR ranges and availability zones.
  - `outputs.tf`: Exports details like VPC ID, subnet IDs, and route table IDs.

## Usage

1. **Install Terraform**: Make sure Terraform is installed on your system. You can download it from the [official website](https://www.terraform.io/downloads).

2. **Initialize the environment**:
   Navigate to the `environments/dev` directory and run:
   ```bash
   terraform init
   ```

3. **Plan the infrastructure**:
   ```bash
   terraform plan
   ```

4. **Apply the changes**:
   ```bash
   terraform apply
   ```

5. **Destroy the infrastructure**:
   When you want to tear down the resources:
   ```bash
   terraform destroy
   ```

## Notes

- Make sure you have set up your AWS credentials correctly in your environment or Terraform's configuration.
- Customize variables in `variables.tf` files as needed for different environments and requirements.
- Review each module’s outputs to understand what information is available for further use.

## Contributions

Feel free to contribute to this project by adding new modules, enhancing existing ones, or optimizing configurations.

---

**Terraform Project** - Version 1.0.0
```

This `README.md` provides a comprehensive overview of the project structure, usage, and instructions. Let me know if you need any further customization!