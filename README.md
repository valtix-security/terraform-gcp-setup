# terraform-gcp-setup
Create Service Accounts, enable API Services and prepare your GCP account to enable Valtix Controller access your account and deploy Valtix Security Gateways. The repo provides a full working example. You can clone this and use this as a module from your other terraform scripts.

# Requirements
1. Enable terraform to access your GCP account. Check here for the options https://registry.terraform.io/providers/hashicorp/google/latest/docs (Quick Summary: `gcloud auth application-default login` or if you intend to use a Service Account to run terraform, then create a key for the service account and provided the downloaded file as the value of the `gcp_credentials_file` )
1. Login to the Valtix Dashboard and generate an API Key using the instructions provided here: https://registry.terraform.io/providers/valtix-security/valtix/latest/docs

## Variables

* `prefix` - (Required) Prefix added to the service accounts (and any other resources) created
* `project_id` - (Required) GCP Project Id where the Service Accounts (and eventually Valtix Gateways) are created
* `gcp_credentials_file` - (Optional) GCP Credentials file (Defaults to $HOME/.config/gcloud/application_default_credentials.json)
* `valtix_api_key_file` - (Required) Valtix API Key file Name downloaded in the above step
* `valtix_cloud_account_name` - (Required) Name to use to represent the GCP Project on the Valtix Controller's Dashboard

## Running as root module
```
git clone https://github.com/valtix-security/terraform-gcp-setup.git
cd terraform-gcp-setup
mv provider provider.tf
```

Edit `values` file with the appropriate values for the variables

```
terraform init
terraform apply -var-file values
```

## Outputs

* `client_email` - Service Account used by the Valtix Controller to manage your GCP Account
* `controller_account` - Same value as `client_email`
* `gateway_account` - Service Account used by the Valtix Gateways
* `project_id` - Project Id that was provided in the variables
* `private_key` - Not displayed. The content is the file contents that you would have otherwise downloaded as part of the Service account's key

## Using inside another module or a root module

Create a tf file with the following content

```hcl
terraform {
  required_providers {
    valtix = {
      source = "valtix-security/valtix"
    }
    google = {
      source = "hashicorp/google"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}

provider "google" {
  project = "project-id-1234"
  # setup your optional gcp credentials here
  # credentials = "creds-filename.json"
}

provider "valtix" {
  api_key_file = file("valtix_api_key.json")
}

module "gcp_setup" {
  source                    = "github.com/valtix-security/terraform-gcp-setup"
  prefix                    = "someprefix"
  project_id                = "project-id-1234"
  valtix_cloud_account_name = "project-id-1234"
  valtix_api_key_file       = "valtix_api.json"
}
```

You can use variables instead of hardcoded values

In the directory where you created the above file, run the following commands

```
terraform init
terraform apply
```