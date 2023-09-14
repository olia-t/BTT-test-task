data "azurerm_client_config" "current" {}

#Data about the existing rg
data "azurerm_resource_group" "rg-BTT" {
  name = "BTT-test-task"
}

resource "azurerm_key_vault" "kv-BTT" {
  name                        = "BTT-key-vault-1"
  location                    = data.azurerm_resource_group.rg-BTT.location
  resource_group_name         = data.azurerm_resource_group.rg-BTT.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

#Access for sp-terraform
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List"
    ]

    secret_permissions = [
      "Get",
      "List"
    ]

    storage_permissions = [
      "Get",
      "List"
    ]
  
  }
#Access for my user
    access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "79c32ba5-7769-43dc-9c1d-91b74f5e1ade"

    key_permissions = [
    "Get",
    "List",
    "Create",
    "Delete",
    "Update",
    "Import",
    "Backup",
    "Restore",
    "Recover",
    "Purge",
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Purge",
    "Backup",
    "Restore",
  ]

  certificate_permissions = [
    "Get",
    "List",
    "Delete",
    "Create",
    "Import",
    "Update",
    "ManageContacts",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
    "ManageIssuers",
    "Recover",
    "Purge",
    "Backup",
    "Restore",
  ]
    }
}

#ACR
resource "azurerm_container_registry" "acr-BTT" {
  name                = "BTTcontainerregistry1"
  resource_group_name = data.azurerm_resource_group.rg-BTT.name
  location            = data.azurerm_resource_group.rg-BTT.location
  sku                 = "Basic"
}