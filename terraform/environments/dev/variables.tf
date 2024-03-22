variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "rgu-sandbox-gcp-9677"
}

variable "region" {
  description = "GCP location/region ID"
  type        = string
  default     = "europe-west9"
}

variable "gcp_labels" {
  description = "Default labels applied to all GCP resources"
  type        = map(string)
  default = {
    "team" : "example",
    "project" : "terraform-example",
    "environment" : "dev",
  }
}