output "kv_name" {
  value = "Key Vault: ${azurerm_key_vault.main.name}"
}

output "apim" {
  value = "API Management: ${azurerm_api_management.main_api.name}"
}
