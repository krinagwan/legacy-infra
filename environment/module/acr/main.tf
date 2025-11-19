# Azure Container Registry (ACR)
# -------------------------
resource "azurerm_container_registry" "acr" {
    for_each = var.acr
  name                = each.value.acrname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled

  tags = each.value.tags
}