#Azure Key Vault#

data "azurerm_client_config" "current" {}

#Data about the existing rg
data "azurerm_resource_group" "rg-BTT" {
  name = "BTT-test-task"
}