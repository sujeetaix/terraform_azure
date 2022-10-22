resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "kuberenetes" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.cluster_name
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_b2s"
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = "/subscriptions/a0d8b970-be97-4907-b131-502984af3755/resourceGroups/jankins_RG/providers/Microsoft.ContainerRegistry/registries/votingappdemobharath"
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.kuberenetes.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.kuberenetes]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.kuberenetes.kube_config_raw
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.kuberenetes.kube_config_raw
  sensitive = true
}


