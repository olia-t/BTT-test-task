data "azurerm_client_config" "current" {}

#Data about the existing rg
data "azurerm_resource_group" "rg-BTT" {
  name = var.resource_group_name
}

#Data about the existing key_vault
data "azurerm_key_vault" "kv-BTT" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

output "vault_uri" {
  value = data.azurerm_key_vault.kv-BTT.vault_uri
}

output "access_policy" {
  value = data.azurerm_key_vault.kv-BTT.access_policy
  
}

output "sku_name" {
  value = data.azurerm_key_vault.kv-BTT.sku_name
  
}


#ACR and pre-requiesites - sp-aks SP
data "azuread_service_principal" "sp_aks" {
  application_id = data.azurerm_key_vault_secret.spn_id.value
}

data "azurerm_container_registry" "acr-BTT" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "acrpull_role" {
  scope = data.azurerm_container_registry.acr-BTT.id
  role_definition_name = "AcrPull"
  principal_id = data.azuread_service_principal.sp_aks.id
  skip_service_principal_aad_check = true
  
}

output "login_server" {
  value = data.azurerm_container_registry.acr-BTT.login_server
}

output "sku" {
  value = data.azurerm_container_registry.acr-BTT.sku
  
}

#AKS cluster pre-requisites
data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = var.ssh_kv_secret
  key_vault_id = data.azurerm_key_vault.kv-BTT.id
}

data "azurerm_key_vault_secret" "spn_id" {
  name         = var.spn_client_id
  key_vault_id = data.azurerm_key_vault.kv-BTT.id
}
data "azurerm_key_vault_secret" "spn_secret" {
  name         = var.spn_kv_secret
  key_vault_id = data.azurerm_key_vault.kv-BTT.id
}

# #AKS cluster
# resource "azurerm_kubernetes_cluster" "aks-clbtcl" {
#   name                = var.kubernetes_cluster_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   dns_prefix          = "${var.resource_group_name}-cluster"
#   node_resource_group = "${var.resource_group_name}-nrg"

#   default_node_pool {
#     name                = "defaultpool"
#     node_count          = 1
#     vm_size             = "Standard_D2_v2"
#     enable_auto_scaling = false

#   }
#   #to enable auto-scaling
#   # enable_auto_scaling = false
#   # max_count = 3
#   # min_count = 1
#   # type = "VirtualMachineScaleSets"

#   linux_profile {
#     admin_username = var.admin_username
#     ssh_key {
#       key_data = data.azurerm_key_vault_secret.ssh_public_key.value
#     }
#   }

#   service_principal {
#     client_id     = data.azurerm_key_vault_secret.spn_id.value
#     client_secret = data.azurerm_key_vault_secret.spn_secret.value
#   }
  
#   network_profile {
#     network_plugin    = "kubenet"
#     load_balancer_sku = "standard"
#   }

#   tags = {
#     Environment = "Dev"
#   }
# }

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.aks-clbtcl.kube_config.0.client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.aks-clbtcl.kube_config_raw

#   sensitive = true
# }