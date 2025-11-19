resource "azurerm_subnet" "example" {
  
  for_each = var.snet
  name                 = each.value.subnetname
 resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes
  
}


