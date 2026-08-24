resource "azurerm_resource_group" "rahulRG" {
  name     = "dev-rg"
  location = "central india"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "dev-aks"
  location            = azurerm_resource_group.rahulRG.location
  resource_group_name = azurerm_resource_group.rahulRG.name
  dns_prefix          = "dns-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_d2_v4"
  }

  identity {
    type = "SystemAssigned"
  }

}

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.aks1.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.aks1.kube_config_raw

#   sensitive = true
# }