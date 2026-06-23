variable "project_name" {
  description = "Project name used for resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used for resource names and tags."
  type        = string
}

variable "hosted_zone_name" {
  description = "Existing Route 53 hosted zone name, for example example.com."
  type        = string
}

variable "app_domain" {
  description = "Customer-facing application DNS name, for example dev.example.com."
  type        = string
}

variable "ingress_class_name" {
  description = "Kubernetes Ingress class name used by AWS Load Balancer Controller."
  type        = string
  default     = "alb"
}

variable "alb_name" {
  description = "AWS ALB name requested through the Kubernetes Ingress annotation."
  type        = string
  default     = null
}

variable "alb_group_name" {
  description = "AWS Load Balancer Controller ingress group name."
  type        = string
  default     = "microservices-demo"
}

variable "healthcheck_path" {
  description = "ALB target health check path for the Istio ingress gateway."
  type        = string
  default     = "/healthz/ready"
}

variable "healthcheck_port" {
  description = "ALB target health check port for the Istio ingress gateway."
  type        = string
  default     = "15021"
}

variable "enable_alb_deletion_protection" {
  description = "Whether the ALB created by the Kubernetes Ingress should enable deletion protection."
  type        = bool
  default     = true
}

variable "waf_rate_limit" {
  description = "Maximum requests per 5-minute period from a single IP before WAF blocks the source."
  type        = number
  default     = 2000
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
