output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "ARN of the EKS cluster."
  value       = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  description = "Endpoint URL for the EKS API server."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate authority data for the EKS cluster."
  value       = aws_eks_cluster.this.certificate_authority[0].data
  sensitive   = true
}

output "cluster_security_group_id" {
  description = "Security group ID created for the EKS cluster."
  value       = aws_security_group.eks_allow_all.id
}

output "cluster_iam_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane."
  value       = aws_iam_role.cluster.arn
}

output "node_group_name" {
  description = "Name of the EKS managed node group."
  value       = aws_eks_node_group.this.node_group_name
}

output "node_group_arn" {
  description = "ARN of the EKS managed node group."
  value       = aws_eks_node_group.this.arn
}

output "node_group_iam_role_arn" {
  description = "ARN of the IAM role used by the EKS managed node group."
  value       = aws_iam_role.node_group.arn
}

output "node_group_autoscaling_group_names" {
  description = "Auto Scaling Group names backing the EKS managed node group."
  value       = aws_eks_node_group.this.resources[0].autoscaling_groups[*].name
}

output "argocd_namespace" {
  description = "Namespace where Argo CD is installed."
  value       = var.enable_argocd ? kubernetes_namespace.argocd[0].metadata[0].name : null
}

output "argocd_release_name" {
  description = "Helm release name for Argo CD."
  value       = var.enable_argocd ? helm_release.argocd[0].name : null
}

output "argocd_chart_version" {
  description = "Deployed Argo CD Helm chart version."
  value       = var.enable_argocd ? helm_release.argocd[0].version : null
}

output "aws_load_balancer_controller_role_arn" {
  description = "IAM role ARN used by AWS Load Balancer Controller."
  value       = var.enable_aws_load_balancer_controller ? aws_iam_role.aws_load_balancer_controller[0].arn : null
}

output "aws_load_balancer_controller_release_name" {
  description = "Helm release name for AWS Load Balancer Controller."
  value       = var.enable_aws_load_balancer_controller ? helm_release.aws_load_balancer_controller[0].name : null
}

output "ebs_csi_role_arn" {
  description = "IAM role ARN used by AWS EBS CSI driver."
  value       = var.enable_ebs_csi_driver ? aws_iam_role.ebs_csi[0].arn : null
}

output "ebs_csi_addon_arn" {
  description = "ARN of the AWS EBS CSI EKS add-on."
  value       = var.enable_ebs_csi_driver ? aws_eks_addon.ebs_csi[0].arn : null
}

output "ebs_gp3_storage_class_name" {
  description = "Name of the gp3 EBS StorageClass."
  value       = var.enable_ebs_csi_driver && var.enable_ebs_gp3_storage_class ? kubernetes_storage_class.ebs_gp3[0].metadata[0].name : null
}

output "istio_namespace" {
  description = "Namespace where Istio is installed."
  value       = var.enable_istio ? kubernetes_namespace.istio_system[0].metadata[0].name : null
}

output "istiod_release_name" {
  description = "Helm release name for istiod."
  value       = var.enable_istio ? helm_release.istiod[0].name : null
}

output "istio_ingress_gateway_release_name" {
  description = "Helm release name for Istio ingress gateway."
  value       = var.enable_istio && var.enable_istio_ingress_gateway ? helm_release.istio_ingress_gateway[0].name : null
}
