variable "primary_location" {
  type = string
}

variable "application_name" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "publisher_name" {
  type = string
}

variable "publisher_email" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "sku_count" {
  type = number
  validation {
    condition     = contains([1, 2], var.sku_count)
    error_message = "The sku_count must be one of the following: 1, 2."
  }
}
