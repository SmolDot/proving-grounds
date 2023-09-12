resource "azurerm_resource_group" "rg" {
  name     = "git-test"
  location = "norwayeast"
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_storage_account" "git_storage" {
  name                     = "gitteststorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
