# Edge Routing Module

Creates the DNS-adjacent resources used by the public EKS application edge:

- Looks up an existing public Route 53 hosted zone.
- Creates and DNS-validates a regional ACM certificate.
- Creates a regional WAFv2 Web ACL for the ALB.
- Outputs ALB Ingress annotations consumed by the GitOps Helm chart.

This module does not create the ALB directly. AWS Load Balancer Controller creates the ALB from the Kubernetes `Ingress`.
