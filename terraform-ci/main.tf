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

#ACR
data "azurerm_container_registry" "acr-BTT" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
}

output "login_server" {
  value = data.azurerm_container_registry.acr-BTT.login_server
}

output "sku" {
  value = data.azurerm_container_registry.acr-BTT.sku
  
}

# #AKS cluster
# data "azurerm_kubernetes_cluster" "aks-clbtcl" {
#   name                = var.kubernetes_cluster_name
#   resource_group_name = var.resource_group_name
# }