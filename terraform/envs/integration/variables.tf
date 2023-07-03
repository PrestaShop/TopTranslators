variable "project" {
  type        = string
  description = "GCP Project name"
  default     = "ps-translators-integration"
}

variable "region" {
  type        = string
  description = "GCP region name"
  default     = "europe-west1"
}

variable "default_zone" {
  type        = string
  description = "Belgium zone will be the default zone"
  default     = "europe-west1-c"
}

variable "app_version" {
  description = "Application tag"
  default     = "latest"
}

variable "hash_id" {
  description = "Github commit hash"
  default     = "latest"
}

variable "environment" {
  description = "Project environment"
  default     = "integration"
}
