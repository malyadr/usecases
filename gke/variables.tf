variable "gcp_project_id" {
    description = "gcp project id"
    type      = string
    default = "malyadri-410908"
}

variable "gcp_region" {
    description = "gcp region"
    type      = string
    default = "us-central1"
}

variable "gke_cluster_name" {
    description = "gke cluster name"
    type      = string
    default = "gke-cluster-terraform"
}

variable "gcp_zones" {
    description = "zone of the cluster"
    type = list(string)
    default = ["us-central1-a"]
}

variable "network" {
    description = "name of the vpc"
    type      = string
    default = "test-vpc"
}

variable "subnetwork" {
    description = "name of the subnetwork"
    type      = string
    default = "gke-subnet"
}

variable "gke_default_nodepool_name" {
    description = "name of the node"
    type      = string
    default   = "node-pool"
}

variable "machine_type" {
    description = "name of the machine type"
    type      = string
    default   = "e2-medium"
}

variable "min_count" {
    description = "minimum count of the instances"
    type      = number
    default   = 2
}

variable "max_count" {
    description = "maximum count of the instances"
    type      = number
    default   = 3
}

variable "disk_size_gb" {
    description = "size of the disk"
    type      = number
    default   = 100
}

variable "disk_type" {
    description = "type of the disk"
    type      = string
    default   = "pd-standard"
}

variable "image_type" {
    description = "type of the image"
    type      = string
    default   = "COS_CONTAINERD"
}


variable "gke_service_account" {
    description = "service account for the gke"
    type      = string
    default = "usecase@malyadri-410908.iam.gserviceaccount.com"
}