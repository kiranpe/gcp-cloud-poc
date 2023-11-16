output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "us_south1_subnet_id" {
  value = google_compute_subnetwork.subnet["us-south1"].id
}

output "us_east1_subnet_id" {
  value = google_compute_subnetwork.subnet["us-east1"].id
}