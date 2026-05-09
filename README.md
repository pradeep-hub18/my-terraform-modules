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
source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.5.0"
```

Example:

```hcl
module "eks" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.5.0"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  tags               = var.tags
}
```

The EKS module creates the control plane IAM role, managed node group IAM role, required AWS managed policy attachments, an allow-all security group, and a managed node group with two `t3.large` workers by default.

The EKS module also installs platform add-ons by default:

- Argo CD
- AWS Load Balancer Controller
- AWS EBS CSI driver and a default `gp3` StorageClass
- Istio base, istiod, and Istio ingress gateway with `ClusterIP` service type

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

## ECR Module

Source path:

```hcl
source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/ecr?ref=v1.4.0"
```

Example:

```hcl
module "ecr" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/ecr?ref=v1.4.0"

  project_name = "microservices-demo-app"
  environment  = "DEV"

  repository_names = [
    "microapps/auth-service",
    "microapps/catalog-service"
  ]

  full_access_iam_user_names = [
    "pradeep-IAM"
  ]

  tags = {
    Owner = "platform-team"
  }
}
```
