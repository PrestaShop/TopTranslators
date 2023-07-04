module "translators" {
  source    = "git@github.com:PrestaShopCorp/terraform-deployments.git?ref=feat/new-ingresscontroller-traefik"
  namespace = var.namespace
  labels    = var.labels

  endpoint_host                = var.endpoint_host
  endpoint_name                = "translators"
  deploys = [{
    name     = "translators"
    strategy = "RollingUpdate"
    endpoint = {
      enable   = true
      external = true
      path     = "/"
      service_ports = [
        {
          name        = "traefik"
          port        = 8081
          target_port = 80
          protocol    = "TCP"
        },
      ]
    }
    containers = [{
      name             = "translators"
      image            = var.image
      version          = var.app_version
      cpu_request      = "100m"
      cpu_limits       = "1"
      memory_request   = "200Mi"
      memory_limits    = "300Mi"
      port             = 3000
      # healthcheck_path = "/healthcheck"
      # healthcheck_port = 3000
      enable_probes    = false
    }]
  }]
}
