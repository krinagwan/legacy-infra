resource "azurerm_network_interface" "example" {
   for_each = var.nic
  name                = each.value.nicname
   location            = each.value.location
  resource_group_name = each.value.resource_group_name
    tags = each.value.tags

  ip_configuration {
    name                          = each.value.ipconfigname
    subnet_id                     = data.azurerm_subnet.example[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    # public_ip_address_id =data.azurerm_public_ip.vm_pip[each.key].id
  }
}

# data "azurerm_public_ip" "vm_pip" {
#        for_each = var.nic
#   name                =each.value.pipname
#   resource_group_name = each.value.resource_group_name
# }

data "azurerm_subnet" "example" {
  
   for_each = var.nic
  name                 = each.value.subnetname
 resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnetname
}