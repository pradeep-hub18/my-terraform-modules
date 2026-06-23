variable "project_name" {
  description = "Project name used for resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used for resource names and tags."
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID used by AWS Load Balancer Controller."
  type        = string
}

variable "oidc_provider_arn" {
  description = "IAM OIDC provider ARN for the EKS cluster."
  type        = string
}

variable "oidc_provider_host" {
  description = "OIDC issuer hostpath without https://."
  type        = string
}

variable "enable_argocd" {
  description = "Whether to install Argo CD."
  type        = bool
  default     = true
}

variable "argocd_namespace" {
  description = "Namespace where Argo CD will be installed."
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Optional Argo CD Helm chart version."
  type        = string
  default     = null
}

variable "argocd_values" {
  description = "Optional Argo CD Helm values YAML documents."
  type        = list(string)
  default     = []
}

variable "enable_aws_load_balancer_controller" {
  description = "Whether to install AWS Load Balancer Controller."
  type        = bool
  default     = true
}

variable "aws_load_balancer_controller_namespace" {
  description = "Namespace where AWS Load Balancer Controller is installed."
  type        = string
  default     = "kube-system"
}

variable "aws_load_balancer_controller_service_account_name" {
  description = "AWS Load Balancer Controller service account name."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_load_balancer_controller_chart_version" {
  description = "Optional AWS Load Balancer Controller chart version."
  type        = string
  default     = null
}

variable "aws_load_balancer_controller_values" {
  description = "Optional AWS Load Balancer Controller Helm values YAML documents."
  type        = list(string)
  default     = []
}

variable "enable_ebs_csi_driver" {
  description = "Whether to install AWS EBS CSI driver as an EKS add-on."
  type        = bool
  default     = true
}

variable "ebs_csi_driver_addon_version" {
  description = "Optional AWS EBS CSI add-on version."
  type        = string
  default     = null
}

variable "enable_ebs_gp3_storage_class" {
  description = "Whether to create an encrypted gp3 StorageClass."
  type        = bool
  default     = true
}

variable "ebs_gp3_storage_class_name" {
  description = "Name of the gp3 EBS StorageClass."
  type        = string
  default     = "gp3"
}

variable "enable_istio" {
  description = "Whether to install Istio base and istiod."
  type        = bool
  default     = true
}

variable "istio_namespace" {
  description = "Namespace where Istio is installed."
  type        = string
  default     = "istio-system"
}

variable "istio_chart_version" {
  description = "Optional Istio chart version."
  type        = string
  default     = null
}

variable "enable_istio_ingress_gateway" {
  description = "Whether to install Istio ingress gateway."
  type        = bool
  default     = true
}

variable "istio_ingress_gateway_service_type" {
  description = "Istio ingress gateway Kubernetes Service type."
  type        = string
  default     = "ClusterIP"
}

variable "enable_external_secrets" {
  description = "Whether to install External Secrets Operator."
  type        = bool
  default     = true
}

variable "external_secrets_namespace" {
  description = "Namespace where External Secrets Operator is installed."
  type        = string
  default     = "external-secrets"
}

variable "external_secrets_service_account_name" {
  description = "External Secrets Operator service account name."
  type        = string
  default     = "external-secrets"
}

variable "external_secrets_chart_version" {
  description = "Optional External Secrets Operator chart version."
  type        = string
  default     = null
}

variable "external_secrets_values" {
  description = "Optional External Secrets Operator Helm values YAML documents."
  type        = list(string)
  default     = []
}

variable "enable_metrics_server" {
  description = "Whether to install Metrics Server."
  type        = bool
  default     = true
}

variable "metrics_server_chart_version" {
  description = "Optional Metrics Server chart version."
  type        = string
  default     = null
}

variable "metrics_server_values" {
  description = "Optional Metrics Server Helm values YAML documents."
  type        = list(string)
  default     = []
}

variable "addon_helm_timeout" {
  description = "Time in seconds to wait for platform Helm releases."
  type        = number
  default     = 600
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
