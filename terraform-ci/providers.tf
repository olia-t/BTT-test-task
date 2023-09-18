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
  
  backend "azurerm" {
      resource_group_name  = "BTT-test-task"
      storage_account_name = "storbtee"
      container_name       = "conttbte"
      key                  = "terraform.tfstate"
  }

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