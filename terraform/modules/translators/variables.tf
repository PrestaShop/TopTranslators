variable "labels" {
  description = "Application labels"
}

variable "image" {
  type        = string
  description = "Image registry"
}

variable "namespace" {
  type        = string
  description = "namespace K8S"
  default     = "translators"
}
variable "app_version" {
  type        = string
  description = "Application version"
}

variable "endpoint_host" {
  description = "Hostname used for the endpoint"
  type        = string
}
