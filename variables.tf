variable "project" {
  description = "value"
  type        = string

}
# Bucket 
variable "bucket_name" {
  description = "value"
  type        = string

}
variable "location" {
  description = "value"
  type        = string

}

# Object

variable "obj_name" {
  description = "value"
  type        = string

}

# Pub/sub
variable "topic_name" {
  description = "value"
  type        = string

}
# Cloud Functions
variable "function_name" {
    description = "value"
    type = string
}

variable "runtime" {
    description = "value"
    type = string
}
variable "available_memory_mb" {
    description = "value"
    type = string
}
variable "entry_point" {
    description = "value"
    type = string
}
variable "event_type" {
    description = "value"
    type = string
}
variable "region" {
    description = "value"
    type = string
  
}
variable "ingress_settings" {
    description = "value"
    type = string
}
variable "vpc_connector_egress_settings" {
    description = "value"
    type = string
  
}
variable "vpc_connector" {
    description = "value"
    type = string
  
}
# Firestore
variable "collection" {
  description = "value"
  type        = string

}
variable "document_id" {
  description = "value"
  type        = string

}
variable "fields" {
  description = "value"
  type        = string

}
