terraform {

  required_version = ">= 1.4.6, < 2.0.0"

  backend "gcs" {
    bucket = "tf-state-dqwdqdqdfew785fw68ewf"
    prefix = "terraform/state"
  }
}

module "buckets" {
  source = "../../modules/buckets"

  region         = var.region
  project_id     = var.project_id
  default_labels = var.gcp_labels
  buckets_name   = ["my-bucket-example", "example-data", "archive-data"]
}

module "cloud_run" {
  source = "../../modules/cloud_run"

  region         = var.region
  project_id     = var.project_id
  default_labels = var.gcp_labels
  bucket_name    = module.buckets.bucket_name # module output value usage example

  cloud_run = {
    "cloud-run1" = {
      "name" : "hello-world",
      "cpu" : "1",
      "memory" : "1024Mi",
      "image" = "us-docker.pkg.dev/cloudrun/container/hello",
    },
    "cloud-run2" = {
      "name" : "example-dwq8dqwd",
      "cpu" : "2",
      "memory" : "512Mi",
      "image" = "us-docker.pkg.dev/cloudrun/container/hello",
    }
  }
}
