resource "random_id" "bucket_id" {
  for_each = toset(var.buckets_name)

  byte_length = 4
}

resource "google_storage_bucket" "example" {
  for_each = toset(var.buckets_name)

  name     = "${each.value}-${random_id.bucket_id[each.value].hex}"
  location = var.region
}