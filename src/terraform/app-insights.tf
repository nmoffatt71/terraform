data "azurerm_application_insights" "main" {
  name                = "appi-${var.application_name}-${var.environment_name}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  application_type    = "web"
}
