resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = var.disable_api_services_on_destroy
}

resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = var.disable_api_services_on_destroy
}

resource "google_project_service" "iam" {
  service            = "iam.googleapis.com"
  disable_on_destroy = var.disable_api_services_on_destroy
}

resource "google_project_service" "cloud_resource_manager" {
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = var.disable_api_services_on_destroy
}
