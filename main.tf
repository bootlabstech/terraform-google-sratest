# Creating bucket for source code storage for Cloud Functions
resource "google_storage_bucket" "main" {
  name     = var.bucket_name
  project = var.project
  location = var.location
  uniform_bucket_level_access = true


}
resource "google_storage_bucket_object" "obj1" {
  name   = var.obj_name
  source = "/home/bootlabs/Desktop/SRA/IOT/GCP/main.zip"
  bucket = google_storage_bucket.main.name
  depends_on = [
    google_storage_bucket.main
  ]
}

# Creating Pub/Sub topic for Cloud Functions trigger
resource "google_pubsub_topic" "topic" {
  name = var.topic_name
  project = var.project 
  depends_on = [
    google_storage_bucket.main
  ]
}

# Creating Cloud Functions triggered by Pub/Sub
resource "google_cloudfunctions_function" "function" {
  name    = var.function_name
  runtime = var.runtime
  project = var.project
  region = var.region

  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = google_storage_bucket.main.name     # interpolation referencing
  source_archive_object = google_storage_bucket_object.obj1.name # interpolation referencing
  entry_point           = var.entry_point
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic.name # interpolation referencing
  }
  depends_on = [
    google_pubsub_topic.topic
  ]
}

# Creating Firestore Database
resource "google_firestore_document" "main" {
  project     = var.project
  collection  = var.collection
  document_id = var.document_id
  fields      = var.fields
  depends_on = [
    google_cloudfunctions_function.function
  ]
}