data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.this.name

  depends_on = [
    aws_eks_cluster.this
  ]
}

provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}

resource "kubernetes_namespace" "argocd" {
  count = var.enable_argocd ? 1 : 0

  metadata {
    name = var.argocd_namespace

    labels = merge(
      {
        "app.kubernetes.io/name"       = "argocd"
        "app.kubernetes.io/managed-by" = "terraform"
      },
      var.argocd_namespace_labels
    )
  }

  depends_on = [
    aws_eks_node_group.this
  ]
}

resource "helm_release" "argocd" {
  count = var.enable_argocd ? 1 : 0

  name             = var.argocd_release_name
  repository       = var.argocd_chart_repository
  chart            = var.argocd_chart_name
  version          = var.argocd_chart_version
  namespace        = kubernetes_namespace.argocd[0].metadata[0].name
  create_namespace = false
  values           = var.argocd_values
  wait             = true
  timeout          = var.argocd_helm_timeout

  depends_on = [
    aws_eks_node_group.this,
    kubernetes_namespace.argocd,
    helm_release.aws_load_balancer_controller
  ]
}
