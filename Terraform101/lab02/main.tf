resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "random_string" "sa_suffix" {
  length  = 10
  upper   = false
  special = false
}

resource "azurerm_storage_account" "main" {
  name                     = "st${random_string.sa_suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "sc-${var.application_name}-${var.environment_name}"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
