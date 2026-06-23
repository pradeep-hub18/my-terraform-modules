locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = merge(
    var.tags,
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  )

  alb_name = coalesce(var.alb_name, "${local.name_prefix}-alb")

  alb_ingress_annotations = {
    "kubernetes.io/ingress.class"                        = var.ingress_class_name
    "alb.ingress.kubernetes.io/load-balancer-name"       = local.alb_name
    "alb.ingress.kubernetes.io/scheme"                   = "internet-facing"
    "alb.ingress.kubernetes.io/target-type"              = "ip"
    "alb.ingress.kubernetes.io/backend-protocol"         = "HTTP"
    "alb.ingress.kubernetes.io/listen-ports"             = "[{\"HTTP\":80},{\"HTTPS\":443}]"
    "alb.ingress.kubernetes.io/ssl-redirect"             = "443"
    "alb.ingress.kubernetes.io/certificate-arn"          = aws_acm_certificate.this.arn
    "alb.ingress.kubernetes.io/wafv2-acl-arn"            = aws_wafv2_web_acl.this.arn
    "alb.ingress.kubernetes.io/group.name"               = var.alb_group_name
    "alb.ingress.kubernetes.io/ip-address-type"          = "ipv4"
    "alb.ingress.kubernetes.io/healthcheck-path"         = var.healthcheck_path
    "alb.ingress.kubernetes.io/healthcheck-port"         = var.healthcheck_port
    "alb.ingress.kubernetes.io/healthcheck-protocol"     = "HTTP"
    "alb.ingress.kubernetes.io/success-codes"            = "200"
    "alb.ingress.kubernetes.io/load-balancer-attributes" = "deletion_protection.enabled=${var.enable_alb_deletion_protection},access_logs.s3.enabled=false"
  }
}
