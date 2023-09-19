resource "azurerm_storage_account" "storage-bett" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "container-storage-bett" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
}
