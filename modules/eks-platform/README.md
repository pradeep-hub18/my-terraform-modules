# EKS Platform Module

Installs Kubernetes platform controllers on an existing EKS cluster:

- AWS Load Balancer Controller with IRSA
- AWS EBS CSI driver and encrypted gp3 StorageClass
- Istio base, istiod, and ClusterIP ingress gateway
- Argo CD
- External Secrets Operator with IRSA for AWS Secrets Manager
- Metrics Server

The EKS foundation module should create the cluster and OIDC provider. Pass the cluster name, VPC ID, OIDC provider ARN, and OIDC provider host into this module.
