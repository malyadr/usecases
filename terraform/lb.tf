module "gce-lb-http" {
  source            = "../modules/lb"
  network_prefix    = var.network_prefix
  lb_project_id     = var.lb_project_id
  firewall_networks = var.firewall_networks
  #   firewall_networks = [module.vpc.network_name]

  network_protocol    = var.network_protocol
  network_port        = var.network_port
  network_port_name   = var.network_port_name
  network_timeout_sec = var.network_timeout_sec
  network_enable_cdn  = var.network_enable_cdn
  instance_group      = var.instance_group


  health_check_request_path = var.health_check_request_path
  health_check_port         = var.health_check_port

  enable_logging    = var.enable_logging
  log_sampling_rate = var.log_sampling_rate

  iap_enable = var.iap_enable

}
