resource "google_cloud_run_v2_service" "cloud_run" {

  for_each = var.cloud_run

  description = var.bucket_name

  name     = each.value.name
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account = google_service_account.cloud_run_sa[each.key].email
    containers {
      image = each.value.image
      resources {
        limits = {
          cpu    = each.value.cpu
          memory = each.value.memory
        }
      }
    }
  }
}

resource "google_service_account" "cloud_run_sa" {
  for_each     = var.cloud_run
  account_id   = each.key
  display_name = each.value.name
}