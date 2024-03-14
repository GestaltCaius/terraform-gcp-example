terraform {

  required_version = ">= 1.4.6, < 2.0.0"

  backend "gcs" {
    bucket = "tf-example-tf-state-8dwqhd8f"
    prefix = "terraform/state"
  }
}

module "buckets" {
  source = "../../modules/buckets"

  region       = "europe-west9"
  project_id   = "rgu-sandbox-gcp-e8a1"
  buckets_name = ["my-bucket-example", "example-data", "archive-data"]

}

module "cloud_run" {
  source = "../../modules/cloud_run"

  region     = "europe-west9"
  project_id = "rgu-sandbox-gcp-e8a1"
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
