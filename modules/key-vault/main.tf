data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "core" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "core" {
  key_vault_id = azurerm_key_vault.core.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "get",
  ]

  secret_permissions = [
    "get",
  ]
}
