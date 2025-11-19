data "azurerm_client_config" "current" {}

# data "azurerm_resource_group" "example" {
#   for_each = var.kv
#   name     = each.value.resource_group_name
  

# }

resource "azurerm_key_vault" "example" {
    for_each = var.kv
  name                        = each.value.kvname
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = each.value.sku_name  
    tags = each.value.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List"
    ]

    secret_permissions = [
      "Get","Set","Delete","List"
    ]

    storage_permissions = [
      "Get","Set","Delete"
    ]
  }
}


resource "azurerm_key_vault_secret" "username" {
     for_each = var.kv
  name         = each.value.adminusername
  value        = each.value.adminusernamevalue
  key_vault_id = azurerm_key_vault.example[each.key].id
}

resource "azurerm_key_vault_secret" "password" {
     for_each = var.kv
  name         =  each.value.adminpassword
  value        = each.value.adminpasswordvalue
  key_vault_id = azurerm_key_vault.example[each.key].id
}