variable "project_id" {
  description = "GCP project ID the instance lives in."
  type        = string
}

variable "region" {
  description = "GCP region for the instance."
  type        = string
}

variable "name" {
  description = "Name of the Cloud SQL instance."
  type        = string
}

variable "create" {
  description = "Whether this caller creates the Cloud SQL instance (true), or just reads back an instance created by another caller of this module in the same project (false). Exactly one caller sharing a given `name` should set this to true."
  type        = bool
  default     = true
}

variable "network_id" {
  description = "ID of the VPC network to attach the instance to via a private IP (e.g. module.network.network_id from terraform.module.network). Only used when create = true."
  type        = string
  default     = null
}

variable "database_version" {
  description = "Postgres version for the instance. Only used when create = true."
  type        = string
  default     = "POSTGRES_18"
}

variable "tier" {
  description = "Cloud SQL machine tier. Only used when create = true."
  type        = string
  default     = "db-f1-micro"
}

variable "availability_type" {
  description = "Cloud SQL availability type: ZONAL or REGIONAL (REGIONAL = HA, higher cost). Only used when create = true."
  type        = string
  default     = "ZONAL"
}

variable "disk_size_gb" {
  description = "Cloud SQL disk size in GB. Only used when create = true."
  type        = number
  default     = 10
}

variable "deletion_protection" {
  description = "Whether to block destruction of the instance via Terraform. Only used when create = true."
  type        = bool
  default     = true
}

variable "labels" {
  description = "Labels applied to the instance. Only used when create = true."
  type        = map(string)
  default     = {}
}

variable "database_name" {
  description = "Name of the Postgres database to create for this caller on the shared instance. Leave null to skip managing a database/user."
  type        = string
  default     = null
}

variable "database_user" {
  description = "Name of the Postgres user to create for this caller. Required when database_name is set."
  type        = string
  default     = null
}
