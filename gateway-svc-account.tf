resource "google_service_account" "gateway_account" {
  account_id   = "${var.prefix}-gateway"
  display_name = "${var.prefix}-gateway"
}

resource "google_project_iam_member" "secretmanager" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.gateway_account.email}"
}

resource "google_project_iam_member" "logwriter" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gateway_account.email}"
}
