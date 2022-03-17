resource "time_sleep" "wait_for_controller_account" {
  depends_on = [
    google_service_account_key.controller_account_key
  ]
  create_duration = "15s"
}

resource "valtix_cloud_account" "gcp" {
  name                 = var.valtix_cloud_account_name
  csp_type             = "GCP"
  gcp_credentials_file = base64decode(google_service_account_key.controller_account_key.private_key)
  depends_on = [
    time_sleep.wait_for_controller_account
  ]
}
