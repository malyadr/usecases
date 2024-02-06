module "vm_mig" {
  source                       = "../modules/mig"
  hostname                     = var.hostname
  mig_name                     = var.mig_name
  mig_project_id               = var.mig_project_id
  mig_region                   = var.mig_region
  instance_template_self_link  = var.instance_template_self_link
  health_check_name            = var.health_check_name
  health_check                 = var.health_check
  autoscaler_name              = var.autoscaler_name
  autoscaling_enabled          = var.autoscaling_enabled
  max_replicas                 = var.max_replicas
  min_replicas                 = var.min_replicas
  cooldown_period              = var.cooldown_period
  autoscaling_cpu              = var.autoscaling_cpu
  named_ports                  = var.named_ports
  autoscaling_scale_in_control = var.autoscaling_scale_in_control
  target_size                  = var.target_size
}
