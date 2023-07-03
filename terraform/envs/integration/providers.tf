terraform {
  required_version = ">=1.3"
  required_providers {
    kubernetes = ">=2.18"
    google     = ">=4.15"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.default_zone
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "gke_distribution-integration_europe-west1-c_distribution"
}
