# Networking Module

Creates the VPC foundation for EKS:

- Public subnets tagged for internet-facing ALBs.
- Private subnets tagged for internal load balancers.
- Public and private route tables per subnet/AZ.
- Optional NAT gateways, either single shared NAT or one NAT per private subnet/AZ.
- Optional VPC endpoints for ECR, S3, CloudWatch Logs, STS, Secrets Manager, KMS, and EC2.

For production-style EKS environments, set:

```hcl
enable_nat_gateway   = true
single_nat_gateway   = false
enable_vpc_endpoints = true
```
