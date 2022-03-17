# terraform-gcp-setup
Create Service Accounts, enable API Services and prepare your GCP account to enable Valtix Controller access your account and deploy Valtix Security Gateways. The repo provides a full working example. You can clone this and use this as a module from your other terraform scripts.

# Requirements
1. Enable terraform to access your GCP account. Check here for the options https://registry.terraform.io/providers/hashicorp/google/latest/docs.
1. Login to the Valtix Dashboard and generate an API Key using the instructions provided here: https://registry.terraform.io/providers/valtix-security/valtix/latest/docs

## Variables Reference

* `prefix` - (Required) Prefix added to the service accounts (and any other resources) created
* `project_id` - (Required) GCP Project Id where the Service Accounts (and eventually Valtix Gateways) are created

## Outputs

* `client_email` - Service Account used by the Valtix Controller to manage your GCP Account
* `controller_account` - Same value as `client_email`
* `gateway_account` - Service Account used by the Valtix Gateways
* `project_id` - Project Id that was provided in the variables
* `private_key` - Not displayed. The content is the file contents that you would have otherwise downloaded as part of the Service account's key 

## Using in a root module

```hcl
terraform {
  required_providers {
    valtix = {
      source = "valtix-security/valtix"
    }
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "project-id-1234"
  # setup your optional gcp credentials here
}

provider "valtix" {
  api_key_file = file("valtix_api_key.json")
}

module "gcp_setup" {
  source     = "github.com/valtix-security/terraform-gcp-setup"
  # or clone the above module and use the local path
  # source     = "/some/dir/terraform-gcp-setup"
  prefix     = "someprefix"
  project_id = "project-id-1234"
}

resource "valtix_cloud_account" "gcp1" {
  name                 = "gcpaccount1"
  csp_type             = "GCP"
  gcp_credentials_file = module.gcp_setup.private_key
}
```