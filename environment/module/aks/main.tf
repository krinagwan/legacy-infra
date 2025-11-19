# AKS Cluster
# -------------------------
resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks
  name                = each.value.aksname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = each.value.kubernetes_version

  identity {
    type         = each.value.type
    identity_ids = [azurerm_user_assigned_identity.aks_identity[each.key].id]
  }

  default_node_pool {
    name           = each.value.poolname
    node_count     = each.value.node_count
    vm_size        = each.value.vm_size
    vnet_subnet_id = data.azurerm_subnet.example[each.key].id
  }

  network_profile {
    network_plugin    = each.value.network_plugin
    load_balancer_sku = each.value.load_balancer_sku
  }

  role_based_access_control_enabled = each.value.role_based_access_control_enabled

  tags = each.value.tags
}

data "azurerm_subnet" "example" {
     for_each = var.aks
  name                 =each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}


# # Grant AKS identity AcrPull on ACR
# resource "azurerm_role_assignment" "aks_acr_pull" {

#   scope                = azurerm_container_registry.acr.id
#   role_definition_name = "AcrPull"
#   principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
# }


resource "azurerm_user_assigned_identity" "aks_identity" {
  for_each = var.aks
  name                = each.value.aksidentityname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}