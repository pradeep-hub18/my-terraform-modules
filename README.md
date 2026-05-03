# My Terraform Modules

Reusable Terraform modules.

## Networking Module

Source path:

```hcl
source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.2.0"
```

Example:

```hcl
module "networking" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.2.0"

  project_name        = var.project_name
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                = var.tags
}
```

## EKS Module

Source path:

```hcl
source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.2.0"
```

Example:

```hcl
module "eks" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.2.0"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  tags               = var.tags
}
```

The EKS module creates the control plane IAM role, managed node group IAM role, required AWS managed policy attachments, an allow-all security group, and a managed node group with two `t3.large` workers by default.

EKS requires private subnets in at least two Availability Zones. The networking module now creates multiple private subnets and exports them as `private_subnet_ids` for the EKS module.

## NLB Module

Source path:

```hcl
source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/nlb?ref=v1.2.0"
```

Example:

```hcl
module "nlb" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/nlb?ref=v1.2.0"

  project_name                           = var.project_name
  environment                            = var.environment
  vpc_id                                 = module.networking.vpc_id
  subnet_ids                             = module.networking.public_subnet_ids
  eks_node_group_autoscaling_group_names = module.eks.node_group_autoscaling_group_names
  tags                                   = var.tags
}
```
