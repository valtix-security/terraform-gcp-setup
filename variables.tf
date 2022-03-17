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

variable "valtix_api_key_file" {
  description = "Valtix API key file name"
  default     = ""
}

variable "disable_api_services_on_destroy" {
  description = "Disable gcloud apiservices on terraform destroy"
  default     = false
}

variable "valtix_cloud_account_name" {
  description = "Name to use for the GCP Project on the Valtix Dashboard (Valtix Controller)"
}
