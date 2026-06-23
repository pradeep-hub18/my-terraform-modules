locals {
  name_prefix = "${var.project_name}-${var.environment}"

  nat_gateway_count = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : length(var.private_subnet_cidrs)) : 0

  interface_vpc_endpoint_services = toset([
    for service in var.interface_vpc_endpoint_services :
    service if var.enable_vpc_endpoints
  ])

  common_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "terraform"
      Project     = var.project_name
    },
    var.tags
  )
}
