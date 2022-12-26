# in this file we can set values to the variable that we have defined inside variable.tf file
aks_vnet_name = "aksvnet"

sshkvsecret = "aks-ssh-pub"

clientidkvsecret = "aks-spn-id"

spnkvsecret = "aks-spn-secret"

win_kv_secret = "winNodePasswd"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/27"]

appgwsubnetcidr = ["10.0.0.31/27"]

keyvault_rg = "vault-group"

keyvault_name = "saj-test-vault"

azure_region = "centralindia"

resource_group = "demo-aks-grp"

cluster_name = "aks-terraform"

dns_name = "aksdemocluster"

admin_username = "aksuser"

storagesecretkey = "storageAccKey"

storage_rg_name = "vault-group"

storage_accname = "terrastore2023"

cont_name = "tfstatefiles"

kubernetes_version = "1.24.6"

logan_name = "centrallog"

addons = {
  ingress_app_gw = true
  oms_agent = true
}

agent_pools = {
      name            = "nodepool01"
      count           = 2
      vm_size         = "Standard_D2_v2"
      os_disk_size_gb = "30"
    }
