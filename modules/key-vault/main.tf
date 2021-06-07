data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "core" {
    name                        = var.key_vault_name
    location                    = var.location
    resource_group_name         = var.resource_group_name
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 31
    purge_protection_enabled    = false

    sku_name                    = "standard"

    dynamic network_acls {
        for_each = var.vnet_subnets == null ? [] : [1]
        content {
            bypass                      = "AzureServices"
            virtual_network_subnet_ids  = var.vnet_subnets
            default_action              = "Deny"
        }
    }

    tags = var.tags
}

resource "azurerm_key_vault_access_policy" "system" {
    key_vault_id = azurerm_key_vault.core.id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]
    storage_permissions = ["get"]
}

resource "azurerm_key_vault_access_policy" "core" {
    count               = length(var.read_access_object_ids)

    key_vault_id        = azurerm_key_vault.core.id
    tenant_id           = data.azurerm_client_config.current.tenant_id
    object_id           = var.read_access_object_ids[count.index]

    key_permissions     = ["get"]
    secret_permissions  = ["get"]
}


resource "azurerm_key_vault_secret" "core" {
  count = length(keys(var.secrets))

  name         = nonsensitive(keys(var.secrets)[count.index])
  value        = var.secrets[keys(var.secrets)[count.index]]
  key_vault_id = azurerm_key_vault.core.id
}
