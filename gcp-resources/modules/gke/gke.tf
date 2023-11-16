resource "google_container_cluster" "gke" {
  name                     = var.gke_cluster_name
  location                 = var.zone
  initial_node_count       = 1
  network                  = var.vpc_name
  subnetwork               = var.subnet_name
  min_master_version       = "1.27"
  remove_default_node_pool = true

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.13.0.0/28"
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.11.0.0/21"
    services_ipv4_cidr_block = "10.12.0.0/21"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.7/32"
      display_name = "net1"
    }
  }
}

# Create managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.gke.name
  location   = var.zone
  cluster    = google_container_cluster.gke.name
  node_count = 2 #Typically 1-3 if the cluster location is a zone, and 3 and more if it's a region.

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    labels = {
      env = "dev"
    }

    machine_type = var.vm_machine_type
    #preemptible     = true
    service_account = var.service_account

    metadata = {
      disable-legacy-endpoints = "true"
    }

    tags = ["web"]
  }
}