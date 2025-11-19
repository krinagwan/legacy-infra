


resource "azurerm_public_ip" "bastion_pip" {
       for_each = var.bas
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
    tags = each.value.tags
}

data "azurerm_subnet" "example" {
     for_each = var.bas
  name                 =each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}


resource "azurerm_bastion_host" "bastion" {
    for_each = var.bas
  name                = each.value.basname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                 = each.value.basipconfigname
    subnet_id            = data.azurerm_subnet.example[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }

  tags = each.value.tags
}