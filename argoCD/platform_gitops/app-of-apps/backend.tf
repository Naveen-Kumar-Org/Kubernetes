
terraform {
  cloud {

    organization = "Naveen_org"

    workspaces {
      name = "argocd_app_of_apps"
    }
  }
}