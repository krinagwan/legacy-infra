data "azurerm_key_vault" "example" {
  for_each            = var.vm
  name                = each.value.kvname
  resource_group_name = each.value.resource_group_name
}


data "azurerm_network_interface" "example" {
  for_each            = var.vm
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault_secret" "adminusername" {
  for_each     = var.vm
  name         = each.value.adminusername
  key_vault_id = data.azurerm_key_vault.example[each.key].id
}

data "azurerm_key_vault_secret" "adminpassword" {
  for_each     = var.vm
  name         = each.value.adminpassword
  key_vault_id = data.azurerm_key_vault.example[each.key].id
}

resource "azurerm_linux_virtual_machine" "example" {

  for_each            = var.vm
  name                = each.value.vmname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.adminusername[each.key].value
  admin_password      = data.azurerm_key_vault_secret.adminpassword[each.key].value
  custom_data = base64encode(file(each.value.script_name))
  disable_password_authentication = false
  tags                = each.value.tags
  network_interface_ids = [
    data.azurerm_network_interface.example[each.key].id
    

  ]
  


  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}


resource "azurerm_network_security_group" "vm_nsg" {
    for_each            = var.vm
  name                = each.value.nsgname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_rule" "allow_port_443" {
    for_each            = var.vm
  name                        = each.value.inboundname
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.vm_nsg[each.key].name
  resource_group_name         = each.value.resource_group_name
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
   for_each            = var.vm
  network_interface_id      = data.azurerm_network_interface.example[each.key].id
  network_security_group_id = azurerm_network_security_group.vm_nsg[each.key].id
}
