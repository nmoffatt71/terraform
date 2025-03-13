resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "random_string" "keyvault_suffix" {
  length  = 6
  special = false
  upper   = false

}

resource "random_string" "apim_suffix" {
  length  = 6
  special = false
  upper   = false

}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "main" {
  name                      = "kv-${var.application_name}-${var.environment_name}-${random_string.keyvault_suffix.result}"
  location                  = azurerm_resource_group.main.location
  resource_group_name       = azurerm_resource_group.main.name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  enable_rbac_authorization = true
}

resource "azurerm_role_assignment" "terraform_user" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id

}

resource "azurerm_application_insights" "application_insights" {
  name                = "appi-${var.application_name}-${var.environment_name}"
  location            = var.primary_location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "Node.JS"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "asp-${var.application_name}-${var.environment_name}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.primary_location
  #   kind                = "FunctionApp"
  #   reserved            = true # this has to be set to true for Linux. Not related to the Premium Plan
  sku_name = "F1"
  os_type  = "Linux"

}

resource "azurerm_linux_function_app" "func_main" {
  name                = "func-${var.application_name}-${var.environment_name}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.primary_location

  storage_account_name       = "stf32n5ujq16"
  storage_account_access_key = "devops-dev"
  service_plan_id            = azurerm_service_plan.app_service_plan.id

  site_config {}
}

resource "azurerm_api_management" "main_api" {
  name                = "apim-main-${random_string.apim_suffix.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  publisher_email     = var.publisher_email
  publisher_name      = var.publisher_name
  sku_name            = var.sku_name
}


