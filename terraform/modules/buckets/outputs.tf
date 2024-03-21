
output "bucket_name" {
  value = google_storage_bucket.example[var.buckets_name[0]].name
}
