variable "prefix" {
  description = "Prefix used for the service accounts"
  default     = "valtix"
}

variable "project_id" {
  description = "Project Id"
}

variable "disable_api_services_on_destroy" {
  description = "Disable gcloud apiservices on terraform destroy"
  default     = false
}
