terraform {

  required_version = ">= 1.4.6, < 2.0.0"


  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.20.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region

  add_terraform_attribution_label               = true
  terraform_attribution_label_addition_strategy = "PROACTIVE"
  default_labels                                = var.default_labels
}
