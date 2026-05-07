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

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
