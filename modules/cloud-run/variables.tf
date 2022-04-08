variable "name" {
  description = "(Required) Name must be unique within a namespace, within a Cloud Run region. Is required when creating resources. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated."
  type        = string
}

variable "location" {
  description = "(Required) The location of the cloud run instance. eg us-central1."
  type        = string
}

variable "image" {
  description = "(Required) The container image that will be run."
  type        = string
}

variable "project" {
  description = "(Optional) The project to deploy resources in. If not set, the provider project will be used."
  type        = string
  default     = null
}

variable "iam" {
  description = "(Optional) IAM configuration on the cloud run"
  type        = any
  default     = []
}

variable "service_account_name" {
  description = "(Optional) specify a service account to use as execution account"
  type        = string
  default     = null
}
