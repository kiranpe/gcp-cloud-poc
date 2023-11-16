resource "google_service_account" "sa" {
  account_id   = "cloud-devops-sa"
  display_name = "Service account for resource provisioning."
}