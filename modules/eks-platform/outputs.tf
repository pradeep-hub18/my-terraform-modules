output "aws_load_balancer_controller_role_arn" {
  description = "IAM role ARN used by AWS Load Balancer Controller."
  value       = var.enable_aws_load_balancer_controller ? aws_iam_role.aws_load_balancer_controller[0].arn : null
}

output "ebs_csi_role_arn" {
  description = "IAM role ARN used by AWS EBS CSI driver."
  value       = var.enable_ebs_csi_driver ? aws_iam_role.ebs_csi[0].arn : null
}

output "external_secrets_role_arn" {
  description = "IAM role ARN used by External Secrets Operator."
  value       = var.enable_external_secrets ? aws_iam_role.external_secrets[0].arn : null
}

output "argocd_namespace" {
  description = "Argo CD namespace."
  value       = var.enable_argocd ? kubernetes_namespace.argocd[0].metadata[0].name : null
}

output "istio_namespace" {
  description = "Istio namespace."
  value       = var.enable_istio ? kubernetes_namespace.istio_system[0].metadata[0].name : null
}

output "external_secrets_namespace" {
  description = "External Secrets Operator namespace."
  value       = var.enable_external_secrets ? kubernetes_namespace.external_secrets[0].metadata[0].name : null
}
