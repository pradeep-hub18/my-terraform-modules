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
- Argo CD installed with Helm when `enable_argocd = true`
- AWS Load Balancer Controller installed with IRSA when `enable_aws_load_balancer_controller = true`
- AWS EBS CSI driver add-on and default `gp3` StorageClass when enabled
- Istio base, istiod, and Istio ingress gateway installed with Helm when enabled

The Istio ingress gateway service defaults to `ClusterIP` so external traffic can be handled by AWS Load Balancer Controller through Kubernetes `Ingress` resources. This avoids creating a separate service-level AWS load balancer for Istio.

> Note: AWS `t3.large` instances have 2 vCPU and 8 GiB memory. The module uses `t3.large` because that was requested. If you need more CPU or memory, override `node_instance_types`.

## Example

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

Platform add-ons are enabled by default:

```hcl
enable_argocd                       = true
enable_aws_load_balancer_controller = true
enable_ebs_csi_driver               = true
enable_ebs_gp3_storage_class        = true
enable_istio                        = true
enable_istio_ingress_gateway        = true
istio_ingress_gateway_service_type  = "ClusterIP"
```

When using the networking module in this repository, pass both private subnets directly:

```hcl
private_subnet_ids = module.networking.private_subnet_ids
```
