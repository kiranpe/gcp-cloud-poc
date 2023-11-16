resource "google_compute_forwarding_rule" "default" {
  name                  = "l7-ilb-forwarding-rule"
  project               = var.project_id
  region                = var.region
  ip_protocol           = "TCP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  port_range            = "5000"
  target                = google_compute_region_target_http_proxy.http_proxy.id
  network               = var.vpc_name
  subnetwork            = var.subnet
  network_tier          = "PREMIUM"
}

resource "google_compute_region_target_http_proxy" "http_proxy" {
  name    = "l7-ilb-target-http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = "l7-ilb"
  default_service = google_compute_region_backend_service.backend_service.id
}

resource "google_compute_region_backend_service" "backend_service" {
  name                  = "l7-ilb-backend-service"
  project               = var.project_id
  region                = var.region
  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"

  backend {
    group          = var.kubernetes_cluster_name
    balancing_mode = "UTILIZATION"
  }
}