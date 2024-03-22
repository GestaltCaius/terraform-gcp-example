variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "buckets_name" {
  description = "List of buckets name"
  type        = list(string)
}

variable "default_labels" {
  description = "Default labels applied to all GCP resources"
  type        = map(string)
}