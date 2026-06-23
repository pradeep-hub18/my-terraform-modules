variable "project_name" {
  description = "Project name used for resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used for resource names and tags."
  type        = string
}

variable "aws_region" {
  description = "AWS region used for regional VPC endpoint service names."
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) >= 2
    error_message = "Provide at least two public subnet CIDR blocks."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "Provide at least two private subnet CIDR blocks."
  }
}

variable "availability_zones" {
  description = "Availability zones where the public and private subnets will be created."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "Provide at least two Availability Zones."
  }
}

variable "enable_nat_gateway" {
  description = "Whether private subnets should get outbound internet access through NAT gateways."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to use one shared NAT gateway. Set false for one NAT gateway per private subnet/AZ."
  type        = bool
  default     = true
}

variable "enable_vpc_endpoints" {
  description = "Whether to create private VPC endpoints for common AWS services used by EKS workloads."
  type        = bool
  default     = false
}

variable "interface_vpc_endpoint_services" {
  description = "AWS interface endpoint service suffixes to create when enable_vpc_endpoints is true."
  type        = list(string)
  default = [
    "ecr.api",
    "ecr.dkr",
    "logs",
    "sts",
    "secretsmanager",
    "kms",
    "ec2"
  ]
}

variable "enable_s3_gateway_endpoint" {
  description = "Whether to create an S3 gateway endpoint when enable_vpc_endpoints is true."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
