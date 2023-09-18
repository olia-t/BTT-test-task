terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.72.0"
    }

    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
  }
  
  # backend "azurerm" {
  #     resource_group_name  = var.resource_group_name
  #     storage_account_name = var.storage_account_name
  #     container_name       = var.storage_container_name
  #     key                  = 
  # }

}

provider "azurerm" {
    features {
        key_vault {
            purge_soft_delete_on_destroy    = true
            recover_soft_deleted_key_vaults = true
    }
  }

 #sp-terraform used to authenticate   
    client_id       = var.client_id
    client_secret   = var.client_secret 
    tenant_id       = var.tenant_id
    subscription_id = var.subscription_id
}