resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_name
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg"


  default_node_pool {
    name            = var.agent_pools.name
    node_count      = var.agent_pools.count
    vm_size         = var.agent_pools.vm_size
    os_disk_size_gb = var.agent_pools.os_disk_size_gb
    type            = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepools"        = "linux"
    } 

    
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = data.azurerm_key_vault_secret.ssh_public_key.value
    }
  }
  addon_profile {
    oms_agent {
      enabled                    = var.addons.oms_agent
      log_analytics_workspace_id = azurerm_log_analytics_workspace.Log_Analytics_Space.id
    }

    ingress_application_gateway {
      enabled   = var.addons.ingress_app_gw
      subnet_id =  data.azurerm_subnet.appgw_subnet_id.id
    }
  }
  windows_profile {
    admin_username = var.admin_username
    admin_password = data.azurerm_key_vault_secret.win_passwd_secret.value
  }
  role_based_access_control {
    enabled = true
  }

  service_principal {
    client_id     = data.azurerm_key_vault_secret.spn_id.value
    client_secret = data.azurerm_key_vault_secret.spn_secret.value
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "Standard"
  }
  
  tags = {
    Environment = "Demo"
  }
}
