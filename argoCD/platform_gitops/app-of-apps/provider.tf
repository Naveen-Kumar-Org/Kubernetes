

terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.12.5"
    }
  }
}


data "terraform_remote_state" "eks_cluster" {
    backend = "remote"
    config = {
      organization = "Naveen_org"
      workspaces = {
        name = "AWS_EKS_dev"
      }
    }
    
}


provider "argocd" {
#   server_addr = "${data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname != "" ? data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname : data.kubernetes_service.argocd_server.spec[0].cluster_ip}:443"
  server_addr = "localhost:8080"
#   port_forward_with_namespace = "argocd" 
  insecure                    = true
#   server_addr = data.terraform_remote_state.eks_cluster.outputs.argocd_server_host
  username    = var.argocd_username
  password    = data.terraform_remote_state.eks_cluster.outputs.argocd_initial_admin_password
}
