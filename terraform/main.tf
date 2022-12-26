# 1. Terraform Settings Block

terraform {
  # 1. Required Version Terraform
  required_version = ">= 0.13"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  #3. Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "vault-group"
    storage_account_name  = "terrastore2023"
    container_name        = "tfstatefiles"
    key                   = "data.azurerm_key_vault_secret.storage_Acc_Key.value"
  }  
}

# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {

  }
}

# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {

}

