
resource "azurerm_resource_group" "example" {
    for_each = var.rg
  name     = each.value.resource_group_name
  location = each.value.location
    tags = each.value.tags
}

