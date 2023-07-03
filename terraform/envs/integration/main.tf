locals {
  labels = {
    project     = var.project
    tribe       = ""
    squad       = "distribution"
    environment = var.environment
    github_hash = var.hash_id
  }
}

module "api" {
  source                      = "../../modules/translators"
  labels                      = local.labels
  image                       = "europe-west1-docker.pkg.dev/ps-translators-integration/translators/translators"
  app_version                 = var.app_version
  endpoint_host               = "translators-integration2.prestashop.com"
}
