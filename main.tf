terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.14.0"
    }
    valtix = {
      source = "valtix-security/valtix"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}
