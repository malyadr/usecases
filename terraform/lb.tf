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

      protocol    = var.network_protocol
      port        = var.network_port
      port_name   = var.network_port_name
      timeout_sec = var.network_timeout_sec
      enable_cdn  = var.network_enable_cdn

      health_check = {
        request_path = var.health_check_request_path
        port         = var.health_check_port
      }

      log_config = {
        enable      = var.enable_logging
        sample_rate = var.log_sampling_rate
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
        enable = var.iap_enable
      }
    }
  }
}
