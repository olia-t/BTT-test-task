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

###############################################################################
## template
###############################################################################

# resource "local_file" "this" {
#   count = var.storage_account_test ? 0 : 1
#   content = templatefile("${path.module}/templates/backend.tpl", {
#     storage_account_name = module.naming.storage_account.name_unique
#     container_name       = azurerm_storage_container.this[0].name
#     resource_group_name  = azurerm_resource_group.this[0].name
#     subscription_id      = data.azurerm_subscription.current.subscription_id
#   })
#   filename = "${path.root}/backend.tf"
# }