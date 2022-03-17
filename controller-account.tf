resource "google_service_account" "controller_account" {
  account_id   = "${var.prefix}-controller"
  display_name = "${var.prefix}-controller"
  description  = "Service account used by the Valtix Controller to manage GCP project"
}

resource "google_project_iam_binding" "compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  members = [
    "serviceAccount:${google_service_account.controller_account.email}",
  ]
}

resource "google_project_iam_binding" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  members = [
    "serviceAccount:${google_service_account.controller_account.email}",
  ]
}

resource "google_service_account_key" "controller_account_key" {
  service_account_id = google_service_account.controller_account.id
  public_key_type    = "TYPE_X509_PEM_FILE"
}
