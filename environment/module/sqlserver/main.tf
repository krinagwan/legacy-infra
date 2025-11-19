data "azurerm_key_vault" "example" {
  for_each            = var.sqlserver
  name                = each.value.kvname
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault_secret" "sql_username" {
  for_each     = var.sqlserver
  name         = "sqlusername"
  key_vault_id = data.azurerm_key_vault.example[each.key].id
}

data "azurerm_key_vault_secret" "sql_password" {
  for_each     = var.sqlserver
  name         = "sqlpassword"
  key_vault_id = data.azurerm_key_vault.example[each.key].id
}


resource "azurerm_mssql_server" "example" {
  for_each                     = var.sqlserver
  name                         = each.value.servername
  resource_group_name          = each.value.resource_group_name
  location                     = "Canadacentral"
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.sql_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.sql_password[each.key].value

  tags = each.value.tags
}



