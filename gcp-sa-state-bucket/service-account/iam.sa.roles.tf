locals {
  roles = ["roles/storage.admin", "roles/compute.admin", "roles/compute.networkAdmin", "roles/iam.serviceAccountUser"]
}
resource "google_project_iam_member" "role_access" {
  for_each = toset(local.roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.sa.email}"
}
