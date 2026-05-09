variable "project_name" {
  description = "Project name used for resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used for resource names and tags."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the EKS cluster and node group security group will be created."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where the EKS control plane ENIs and worker node group will run. Use subnets in at least two Availability Zones for EKS."
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) >= 2
    error_message = "Provide at least two private subnet IDs in different Availability Zones for EKS."
  }
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "endpoint_private_access" {
  description = "Whether the EKS private API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the EKS public API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "node_instance_types" {
  description = "EC2 instance types for the EKS managed node group."
  type        = list(string)
  default     = ["t3.large"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_disk_size" {
  description = "Worker node root EBS volume size in GiB."
  type        = number
  default     = 20
}

variable "enable_argocd" {
  description = "Whether to install Argo CD into the EKS cluster."
  type        = bool
  default     = true
}

variable "argocd_namespace" {
  description = "Kubernetes namespace where Argo CD will be installed."
  type        = string
  default     = "argocd"
}

variable "argocd_release_name" {
  description = "Helm release name for Argo CD."
  type        = string
  default     = "argocd"
}

variable "argocd_chart_repository" {
  description = "Helm repository URL for the Argo CD chart."
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "argocd_chart_name" {
  description = "Helm chart name for Argo CD."
  type        = string
  default     = "argo-cd"
}

variable "argocd_chart_version" {
  description = "Optional Argo CD Helm chart version. Leave null to use the latest chart available from the repository."
  type        = string
  default     = null
}

variable "argocd_values" {
  description = "Optional Helm values YAML documents to pass to the Argo CD chart."
  type        = list(string)
  default     = []
}

variable "argocd_helm_timeout" {
  description = "Time in seconds to wait for the Argo CD Helm release to become ready."
  type        = number
  default     = 600
}

variable "argocd_namespace_labels" {
  description = "Additional labels to apply to the Argo CD namespace."
  type        = map(string)
  default     = {}
}

variable "enable_aws_load_balancer_controller" {
  description = "Whether to install AWS Load Balancer Controller."
  type        = bool
  default     = true
}

variable "aws_load_balancer_controller_namespace" {
  description = "Namespace where AWS Load Balancer Controller will be installed."
  type        = string
  default     = "kube-system"
}

variable "aws_load_balancer_controller_release_name" {
  description = "Helm release name for AWS Load Balancer Controller."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_load_balancer_controller_chart_repository" {
  description = "Helm repository URL for AWS Load Balancer Controller."
  type        = string
  default     = "https://aws.github.io/eks-charts"
}

variable "aws_load_balancer_controller_chart_name" {
  description = "Helm chart name for AWS Load Balancer Controller."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_load_balancer_controller_chart_version" {
  description = "Optional AWS Load Balancer Controller Helm chart version. Leave null to use the latest chart available from the repository."
  type        = string
  default     = null
}

variable "aws_load_balancer_controller_service_account_name" {
  description = "Kubernetes service account name for AWS Load Balancer Controller."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_load_balancer_controller_values" {
  description = "Optional Helm values YAML documents for AWS Load Balancer Controller."
  type        = list(string)
  default     = []
}

variable "enable_ebs_csi_driver" {
  description = "Whether to install the AWS EBS CSI driver as an EKS add-on."
  type        = bool
  default     = true
}

variable "ebs_csi_driver_addon_version" {
  description = "Optional AWS EBS CSI driver EKS add-on version. Leave null to use the default version for the cluster."
  type        = string
  default     = null
}

variable "enable_ebs_gp3_storage_class" {
  description = "Whether to create a gp3 StorageClass backed by the EBS CSI driver."
  type        = bool
  default     = true
}

variable "ebs_gp3_storage_class_name" {
  description = "Name of the gp3 EBS StorageClass."
  type        = string
  default     = "gp3"
}

variable "ebs_gp3_storage_class_is_default" {
  description = "Whether to mark the gp3 StorageClass as the default StorageClass."
  type        = bool
  default     = true
}

variable "ebs_gp3_reclaim_policy" {
  description = "Reclaim policy for the gp3 EBS StorageClass."
  type        = string
  default     = "Delete"
}

variable "enable_istio" {
  description = "Whether to install Istio base and istiod."
  type        = bool
  default     = true
}

variable "istio_namespace" {
  description = "Namespace where Istio will be installed."
  type        = string
  default     = "istio-system"
}

variable "istio_chart_repository" {
  description = "Helm repository URL for Istio charts."
  type        = string
  default     = "https://istio-release.storage.googleapis.com/charts"
}

variable "istio_chart_version" {
  description = "Optional Istio Helm chart version. Leave null to use the latest chart available from the repository."
  type        = string
  default     = null
}

variable "istio_base_release_name" {
  description = "Helm release name for Istio base."
  type        = string
  default     = "istio-base"
}

variable "istiod_release_name" {
  description = "Helm release name for istiod."
  type        = string
  default     = "istiod"
}

variable "istio_base_values" {
  description = "Optional Helm values YAML documents for Istio base."
  type        = list(string)
  default     = []
}

variable "istiod_values" {
  description = "Optional Helm values YAML documents for istiod."
  type        = list(string)
  default     = []
}

variable "enable_istio_ingress_gateway" {
  description = "Whether to install the Istio ingress gateway Helm chart."
  type        = bool
  default     = true
}

variable "istio_ingress_gateway_release_name" {
  description = "Helm release name for Istio ingress gateway."
  type        = string
  default     = "istio-ingressgateway"
}

variable "istio_ingress_gateway_service_type" {
  description = "Kubernetes Service type for Istio ingress gateway. Use ClusterIP for ALB Ingress based exposure."
  type        = string
  default     = "ClusterIP"
}

variable "istio_ingress_gateway_values" {
  description = "Optional Helm values YAML documents for Istio ingress gateway."
  type        = list(string)
  default     = []
}

variable "addon_helm_timeout" {
  description = "Time in seconds to wait for platform add-on Helm releases to become ready."
  type        = number
  default     = 600
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
