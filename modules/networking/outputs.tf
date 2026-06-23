output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID of the first public subnet."
  value       = aws_subnet.public[0].id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_id" {
  description = "ID of the first private subnet."
  value       = aws_subnet.private[0].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "ID of the internet gateway."
  value       = aws_internet_gateway.this.id
}

output "nat_eip_id" {
  description = "ID of the first NAT Gateway Elastic IP."
  value       = try(aws_eip.nat[0].id, null)
}

output "nat_eip_ids" {
  description = "IDs of the NAT Gateway Elastic IPs."
  value       = aws_eip.nat[*].id
}

output "nat_gateway_id" {
  description = "ID of the first NAT gateway."
  value       = try(aws_nat_gateway.this[0].id, null)
}

output "nat_gateway_ids" {
  description = "IDs of the NAT gateways."
  value       = aws_nat_gateway.this[*].id
}

output "public_route_table_id" {
  description = "ID of the first public route table."
  value       = aws_route_table.public[0].id
}

output "public_route_table_ids" {
  description = "IDs of the public route tables."
  value       = aws_route_table.public[*].id
}

output "private_route_table_id" {
  description = "ID of the first private route table."
  value       = aws_route_table.private[0].id
}

output "private_route_table_ids" {
  description = "IDs of the private route tables."
  value       = aws_route_table.private[*].id
}

output "interface_vpc_endpoint_ids" {
  description = "Interface VPC endpoint IDs keyed by service suffix."
  value       = { for service, endpoint in aws_vpc_endpoint.interface : service => endpoint.id }
}

output "s3_vpc_endpoint_id" {
  description = "S3 gateway VPC endpoint ID."
  value       = try(aws_vpc_endpoint.s3[0].id, null)
}

output "vpc_endpoint_security_group_id" {
  description = "Security group ID used by interface VPC endpoints."
  value       = try(aws_security_group.vpc_endpoints[0].id, null)
}
