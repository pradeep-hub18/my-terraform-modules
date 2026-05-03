# NLB Module

Creates a Network Load Balancer, TCP target group, TCP listener, and Auto Scaling Group attachments for EKS managed node groups.

The module attaches the EKS node group Auto Scaling Group names to the target group. This is better than attaching individual worker instances because EKS worker nodes are replaced dynamically.

For Kubernetes workloads, expose the application through a `NodePort` service and set `target_port` to that NodePort.
