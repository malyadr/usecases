hostname                    = "myvm"
mig_region                  = "us-central1"
mig_project_id              = "samad-410909"
mig_name                    = "mymig1"
instance_template_self_link = "https://www.googleapis.com/compute/v1/projects/samad-410909/global/instanceTemplates/linux-vm-20240206084449516100000001"
health_check = {
  type                = "http"
  initial_delay_sec   = 60
  check_interval_sec  = 30
  healthy_threshold   = 1
  timeout_sec         = 10
  unhealthy_threshold = 5
  response            = ""
  proxy_header        = "NONE"
  port                = 80
  request             = ""
  request_path        = "/"
  host                = ""
  enable_logging      = false
}
autoscaler_name     = "scaling1"
autoscaling_enabled = "true"
max_replicas        = 3
min_replicas        = 2
cooldown_period     = 60
named_ports = [{
  name = "http"
  port = 80
}]
autoscaling_scale_in_control = {
  percent_replicas = 10
  time_window_sec  = 300
  fixed_replicas   = null
}
autoscaling_cpu = [{
  predictive_method = "NONE"
  target            = 0.7
}]
