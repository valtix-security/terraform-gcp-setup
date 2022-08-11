variable "prefix" {
  description = "Prefix used for the service accounts"
  default     = "valtix"
}

variable "project_id" {
  description = "Project Id"
}

variable "gcp_credentials_file" {
  description = "GCP Credentials file, either downloaded as key of a Service Account or using gcloud auth application-default login"
  default     = "~/.config/gcloud/application_default_credentials.json"
}

variable "disable_api_services_on_destroy" {
  description = "Disable gcloud apiservices on terraform destroy"
  default     = false
}
