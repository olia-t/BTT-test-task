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