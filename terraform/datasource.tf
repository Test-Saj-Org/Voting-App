data "azurerm_key_vault" "azure_vault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = var.sshkvsecret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

data "azurerm_key_vault_secret" "storage_Acc_Key" {
  name         = var.storagesecretkey
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

data "azurerm_key_vault_secret" "spn_id" {
  name         = var.clientidkvsecret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

data "azurerm_key_vault_secret" "spn_secret" {
  name         = var.spnkvsecret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

data "azurerm_key_vault_secret" "win_passwd_secret" {
  name         = var.win_kv_secret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

data "azurerm_subnet" "appgw_subnet_id" {
  name                 = "${azurerm_subnet.appgwsubnet.name}"
  virtual_network_name = "${azurerm_virtual_network.aks_vnet.name}"
  resource_group_name  = "${azurerm_resource_group.aks_rg.name}"
  }

data "azurerm_log_analytics_workspace" "Log_Analytics_Space" {
  name                = var.logan_name
  resource_group_name = "${azurerm_resource_group.aks_rg.name}"
}