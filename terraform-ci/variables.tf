variable "tenant_id" {
    description = "tenant ID for Azure subscription btt"
  
}

variable "subscription_id" {
    description = "Subscription ID for btt"
  
}

variable "client_id" {
    description = "sp-terraform appId to authenticate terraform to Azure"
    default = ""
  
}

variable "client_secret" {
    description = "sp-terraform pw to authenticate terraform to Azure"
    default = ""
  
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
  
}

variable "location" {
    type = string
  
}

variable "key_vault_name" {
    type = string
  
}

variable "container_registry_name" {
    type = string
  
}

variable "kubernetes_cluster_name" {
    type = string
  
}