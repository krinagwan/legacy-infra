
# -------------------------
# Public IP for VM (optional)
# -------------------------
resource "azurerm_public_ip" "vm_pip" {
    for_each = var.pip
  name                =each.value.pipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

