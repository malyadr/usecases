module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region 
  ip_range_pods              = ""
  ip_range_services          = ""
  zones                      = var.gcp_zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = true

  node_pools = [
    {
      name                      = var.gke_default_nodepool_name
      machine_type              = var.machine_type
      min_count                 = var.min_count
      max_count                 = var.max_count
      spot                      = false
      disk_size_gb              = var.disk_size_gb
      disk_type                 = var.disk_type
      image_type                = var.image_type
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.gke_service_account
      preemptible               = true
      initial_node_count        = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {

    default-node-pool = {
      default-node-pool = false
    }
  }
  
  deletion_protection = false

  node_pools_metadata = {

    node-pool = {
      node-pool-metadata-custom-value = "test-1"
    }
  }

  node_pools_taints = {

    node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []
      node-pool = [
      "node-pool-1",
    ]
    # default-node-pool = [
    #   "default-node-pool",
    # ]
  }
}