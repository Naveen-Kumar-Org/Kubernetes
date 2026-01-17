



resource "argocd_application" "teams_argocd_applications" {
  # provider = argocd
#   depends_on = [ helm_release.argocd ]
  metadata {
    name      = "root-app-of-apps"
    namespace = "argocd"
  }
  spec {
    project = "default"
    source {
      repo_url        = "https://github.com/NaveenKumar-Y/Kubernetes.git"
      target_revision = "main"
      path            = "argoCD/platform_gitops/app-of-apps/teams-apps/"  
    }
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "argocd"
    }
    sync_policy {
      automated {
        prune    = true
        self_heal = true
      }
      sync_options = ["CreateNamespace=true"]
    }
  }
}
