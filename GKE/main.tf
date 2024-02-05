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
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true

  node_pools = var.node_pools

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