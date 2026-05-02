# My Terraform Modules

Reusable Terraform modules.

## Networking Module

Source path:

```hcl
source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.0.0"
```

Example:

```hcl
module "networking" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.0.0"

  project_name        = var.project_name
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  tags                = var.tags
}
```
