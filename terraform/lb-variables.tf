variable "network_prefix" {
  type    = string
  default = "dev-vpc"
}

variable "lb_project_id" {
  type    = string
  default = "samad-410909"
}

variable "network_protocol" {
  type    = string
  default = "HTTP"
}

variable "network_port" {
  type    = number
  default = 80
}

variable "network_port_name" {
  type    = string
  default = "http"
}

variable "network_timeout_sec" {
  type    = number
  default = 10
}

variable "network_enable_cdn" {
  type    = bool
  default = false
}

variable "health_check_request_path" {
  default = "/"
  type    = string
}

variable "health_check_port" {
  type    = number
  default = 80
}

variable "enable_logging" {
  type    = bool
  default = true
}

variable "log_sampling_rate" {
  type    = number
  default = 1.0
}

variable "iap_enable" {
  type    = bool
  default = false
}
