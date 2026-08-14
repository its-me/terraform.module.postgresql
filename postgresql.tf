# One caller (create = true) provisions the Cloud SQL instance. Every other caller
# sharing the same `name` in the same project (create = false) just reads it back via
# a data source, so that multiple independently-applied configs can share one Postgres
# instance (each managing its own google_sql_database/google_sql_user on top of it)
# without fighting over who owns it.

resource "google_sql_database_instance" "this" {
  count = var.create ? 1 : 0

  name             = var.name
  project          = var.project_id
  region           = var.region
  database_version = var.database_version

  deletion_protection = var.deletion_protection

  settings {
    tier              = var.tier
    availability_type = var.availability_type
    disk_size         = var.disk_size_gb
    disk_autoresize   = true

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network_id
    }

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
    }

    user_labels = var.labels
  }
}

data "google_sql_database_instance" "this" {
  count = var.create ? 0 : 1

  name    = var.name
  project = var.project_id
}

locals {
  instance_id              = var.create ? google_sql_database_instance.this[0].id : data.google_sql_database_instance.this[0].id
  instance_name            = var.create ? google_sql_database_instance.this[0].name : data.google_sql_database_instance.this[0].name
  instance_connection_name = var.create ? google_sql_database_instance.this[0].connection_name : data.google_sql_database_instance.this[0].connection_name
  instance_private_ip      = var.create ? google_sql_database_instance.this[0].private_ip_address : data.google_sql_database_instance.this[0].private_ip_address
  instance_self_link       = var.create ? google_sql_database_instance.this[0].self_link : data.google_sql_database_instance.this[0].self_link
}
