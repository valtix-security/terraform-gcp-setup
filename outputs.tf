output "project_id" {
  value = var.project_id
}

output "client_email" {
  value = google_service_account.controller_account.email
}

output "controller_account" {
  value = google_service_account.controller_account.email
}

output "gateway_account" {
  value = google_service_account.gateway_account.email
}

output "private_key" {
  value     = base64decode(google_service_account_key.controller_account_key.private_key)
  sensitive = true
}
