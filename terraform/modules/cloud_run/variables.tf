variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

# variable "cloud_runs" {
#   description          = "List of Cloud Run configurations"
#   type                             = list(map(any))
# }

variable "cloud_run" {
  type = map(object({
    name   = string
    cpu    = string
    memory = string
    image  = string
  }))
}

variable "bucket_name" {
  type        = string
  description = "a bucket name"
}