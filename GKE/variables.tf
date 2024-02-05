variable "gcp_project_id" {
    description = "gcp project id"
    default = "malyadri-410908"
}

variable "gcp_region" {
    description = "gcp region"
    default = "us-central1"
}

variable "gke_cluster_name" {
    description = "gke cluster name"
    default = "gke-cluster-terraform"
}

variable "gcp_zones" {
    description = "zone of the cluster"
    type = list(string)
    default = ["us-central1-a"]
}

variable "network" {
    description = "name of the vpc"
    default = "test-vpc"
}

variable "subnetwork" {
    description = "name of the subnetwork"
    default = "gke-subnet"
}



variable "node_pools" {
  description = "details of node pool"
  type = object({
    name                = string
    machine_type        = string
    min_count           = number
    max_count           = number
    spot                = string
    disk_size_gb        = number
    disk_type           = string
    image_type          = string
    enable_gcfs         = string
    enable_gvnic        = string
    auto_repair         = string
    auto_upgrade        = string
    service_account     = string
    preemptible         = string 
    initial_node_count  = number
  })
  default = {
    name                = "node-pool"
    machine_type        = "e2-medium"
    min_count           = 2
    max_count           = 3
    spot                = false
    disk_size_gb        = 100
    disk_type           = "pd-standard"
    image_type          = "COS_CONTAINERD"
    enable_gcfs         = false
    enable_gvnic        = false
    auto_repair         = true
    auto_upgrade        = true
    service_account     = "usecase@malyadri-410908.iam.gserviceaccount.com"
    preemptible         = true
    initial_node_count  = 1
  }
}



