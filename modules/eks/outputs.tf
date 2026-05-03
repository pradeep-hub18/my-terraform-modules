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
