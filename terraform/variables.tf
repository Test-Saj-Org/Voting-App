# file use to define variable in terrafrom here we can assign a defult value or not.

variable "aks_vnet_name" {
    type = string
}

variable "keyvault_rg" {
  type    = string
}
variable "keyvault_name" {
  type    = string
}

variable "sshkvsecret" {
  type    = string
}

variable "storage_rg_name" {
  type    = string
}

variable "clientidkvsecret" {
  type    = string
}

variable "vnetcidr" {
  type    = list
}

variable "subnetcidr" {
  type    = list
}

variable "appgwsubnetcidr" {
  type    = list
}

variable "spnkvsecret" {
  type    = string
}

variable "azure_region" {
  type    = string
}

#  Resource Group Name
variable "resource_group" {
  type    = string
}

# AKS Cluster name
variable "cluster_name" {
  type    = string
}

#AKS DNS name
variable "dns_name" {
  type    = string
}

variable "admin_username" {
  type    = string
}

variable "storage_accname" {
  type    = string
}

variable "cont_name" {
  type    = string
}

variable "win_kv_secret" {
  type    = string
}

variable "storagesecretkey" {
  type    = string
}

variable "logan_name" {
  type = string
}

# Specify a valid kubernetes version
variable "kubernetes_version" {
  type    = string
}

variable "addons" {
  description = "Define which addon needs to activated with aks cluster."
  type = object({
    oms_agent = bool
    ingress_app_gw = bool
  })
}

#AKS Agent pools
variable "agent_pools" {
  type = object({
      name            = string
      count           = number
      vm_size         = string
      os_disk_size_gb = string
    }
  )
}