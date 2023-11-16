locals {
  firewall_rule = {
    allow-ssh        = ["22"],
    allow-80         = ["80"],
    allow-443        = ["443"],
    allow-jenkins    = ["8080"],
    allow-sonar-qube = ["9000"]
  }

  subnets = {
    us-south1 = "10.0.0.0/16"
    us-east1  = "192.168.0.0/16"
  }
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  for_each                 = tomap(local.subnets)
  name                     = each.key
  project                  = var.project_id
  region                   = each.key
  ip_cidr_range            = each.value
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

resource "google_compute_firewall" "firewall_rules" {
  for_each = tomap(local.firewall_rule)
  name     = each.key
  project  = var.project_id
  network  = google_compute_network.vpc.id
  allow {
    protocol = "tcp"
    ports    = each.value
  }
  source_ranges = ["35.235.240.0/20", "76.183.113.246/32"]
  target_tags   = ["web"]
}