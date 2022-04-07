variable "name" {
  description = "(Required) Name must be unique within a namespace, within a Cloud Run region. Is required when creating resources. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated."
  type        = string
}

variable "location" {
  description = "(Required) The location of the cloud run instance. eg us-central1."
  type        = string
}
