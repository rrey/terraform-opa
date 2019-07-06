
resource "google_service_account" "sa_automation" {
  account_id   = "sa-sample"
  display_name = "Service Account for OPA eval"
}

resource "google_project_iam_member" "owner" {
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.sa_automation.email}"
}
