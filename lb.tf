module "gce-lb-http" {
  source  = "terraform-google-modules/lb-http/google"
  version = "10.1.0"
  name    = var.network_prefix
  project = var.lb_project_id
  target_tags = [
    "${var.network_prefix}-group1",
    "${var.network_prefix}-group2"
  ]
  firewall_networks = ["vpc-dev"]
  #   firewall_networks = [module.vpc.network_name]

  backends = {
    default = {

      protocol    = "HTTP"
      port        = 80
      port_name   = "http"
      timeout_sec = 10
      enable_cdn  = false

      health_check = {
        request_path = "/"
        port         = 80
      }

      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        {
          group = module.vm_mig.instance_group
        },
        # {
        #   group = module.mig2.instance_group
        # },
      ]

      iap_config = {
        enable = false
      }
    }
  }
}
