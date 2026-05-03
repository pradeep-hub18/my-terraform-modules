# EKS Module

Creates an Amazon EKS cluster and one managed node group in private subnets.

## Resources

- EKS control plane IAM role with `AmazonEKSClusterPolicy`
- EKS managed node group IAM role with:
  - `AmazonEKSWorkerNodePolicy`
  - `AmazonEKS_CNI_Policy`
  - `AmazonEC2ContainerRegistryReadOnly`
- Security group allowing all inbound and outbound traffic
- EKS cluster
- EKS managed node group with two `t3.large` workers by default

> Note: AWS `t3.large` instances have 2 vCPU and 8 GiB memory. The module uses `t3.large` because that was requested. If you need more CPU or memory, override `node_instance_types`.

## Example

```hcl
module "eks" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.1.0"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  tags               = var.tags
}
```

When using the networking module in this repository, pass both private subnets directly:

```hcl
private_subnet_ids = module.networking.private_subnet_ids
```
