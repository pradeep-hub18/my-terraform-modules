output "domain_name" {
  description = "Customer-facing application DNS name."
  value       = var.app_domain
}

output "hosted_zone_id" {
  description = "Route 53 hosted zone ID."
  value       = data.aws_route53_zone.this.zone_id
}

output "certificate_arn" {
  description = "Validated ACM certificate ARN."
  value       = aws_acm_certificate_validation.this.certificate_arn
}

output "waf_acl_arn" {
  description = "WAFv2 Web ACL ARN."
  value       = aws_wafv2_web_acl.this.arn
}

output "alb_ingress_annotations" {
  description = "Recommended annotations for the Kubernetes ALB Ingress."
  value       = local.alb_ingress_annotations
}

output "alb_name" {
  description = "Recommended ALB name used by the Kubernetes Ingress."
  value       = local.alb_name
}
