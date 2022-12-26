resource "azurerm_kubernetes_cluster_node_pool" "win101" {
    name                  = "window" # name of windows node pool cannot be more than of6 character lenghtss
    mode                  = "User"
    availability_zones    = [1]
    enable_auto_scaling   = true
    kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
    min_count             = 1
    max_count             = 2
    os_type               = "Windows"
    vm_size               = "Standard_D4s_v3"
    node_labels = {
    "nodepool-type" = "user"
    "environment"   = "dev"
    "nodepoolos"    = "windows"
  }
}
