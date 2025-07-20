# helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/


# Only download the metrics server chart if it is not already present. Installation is done by ArgoCD.
resource "null_resource" "clone_repo" {
  provisioner "local-exec" {
    command = "helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/ || true"
  }
}
