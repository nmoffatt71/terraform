resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.location
}

resource "random_string" "sa_suffix" {
  length  = 6
  upper   = false
  special = false
}

data "azurerm_client_config" "current" {
}

