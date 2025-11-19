


data "azurerm_mssql_server" "example" {
  for_each            = var.sqldb
  name                = each.value.servername
 resource_group_name          = each.value.resource_group_name

}

resource "azurerm_mssql_database" "example" {
  for_each       = var.sqldb
  name           = each.value.dbname
  server_id      = data.azurerm_mssql_server.example[each.key].id
  tags           = each.value.tags
  sku_name       = each.value.sku_name
  max_size_gb    = each.value.max_size_gb
  zone_redundant = each.value.zone_redundant
}

