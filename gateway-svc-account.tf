resource "google_service_account" "gateway_account" {
  account_id   = "${var.prefix}-gateway"
  display_name = "${var.prefix}-gateway"
}

resource "google_project_iam_binding" "secretmanager" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.gateway_account.email}",
  ]
}

resource "google_project_iam_binding" "logwriter" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  members = [
    "serviceAccount:${google_service_account.gateway_account.email}",
  ]
}
