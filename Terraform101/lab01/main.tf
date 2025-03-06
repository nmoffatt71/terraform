resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}


locals {
  environment_prefix = "${var.environment_name}-${var.application_name}-${random_string.suffix.result}"
}
