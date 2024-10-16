Here's a simplified version of the README files for each module:

### 1. **Load Balancer Module**

#### Overview
This module sets up AWS Load Balancers, including both Application Load Balancers (ALB) and Network Load Balancers (NLB).

#### Variables
- `lb_type`: Specify either `"alb"` or `"nlb"`.
- `vpc_id`: The ID of the VPC where the load balancer will be deployed.
- `subnets`: List of subnet IDs for the load balancer.
- `security_groups`: List of security group IDs (for ALB only).
- `listener_port` and `listener_protocol`: Configurations for the load balancer listener.
- `target_group_name`, `target_group_port`, and `target_group_protocol`: Settings for the target group.

#### Usage
```hcl
module "load_balancer" {
  source = "../../modules/load_balancer"
  lb_type = "alb"
  vpc_id = var.vpc_id
  subnets = var.subnets
  ...
}
```

### 2. **ALB Module**

#### Overview
This module configures an AWS Application Load Balancer (ALB).

#### Variables
- `alb_name`: Name of the ALB.
- `vpc_id`: VPC ID where the ALB is created.
- `subnets`: List of subnet IDs for the ALB.
- `security_groups`: Security groups associated with the ALB.
- `listener_port` and `listener_protocol`: Listener settings (e.g., `80` for HTTP).
- `target_group_name`, `target_group_port`, `target_group_protocol`: Target group configurations.

#### Usage
```hcl
module "alb" {
  source = "../../modules/load_balancer/alb"
  alb_name = "example-alb"
  vpc_id = var.vpc_id
  subnets = var.subnets
  ...
}
```

### 3. **NLB Module**

#### Overview
This module sets up an AWS Network Load Balancer (NLB).

#### Variables
- `nlb_name`: Name of the NLB.
- `vpc_id`: VPC ID where the NLB is created.
- `subnets`: Subnet IDs for NLB placement.
- `listener_port` and `listener_protocol`: Listener configurations (e.g., `80` for TCP).
- `target_group_name`, `target_group_port`, `target_group_protocol`: Target group details.

#### Usage
```hcl
module "nlb" {
  source = "../../modules/load_balancer/nlb"
  nlb_name = "example-nlb"
  vpc_id = var.vpc_id
  subnets = var.subnets
  ...
}
```