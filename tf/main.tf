resource "azurerm_resource_group" "rg" {
  name     = "git-test"
  location = "norwayeast"
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_storage_account" "git_storage" {
  name                     = "gitteststoraget6y7u89io0"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_service_plan" "gitcreate" {
  name                = "git-app-service-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "gitcreate" {
  name                = "git-linux-function-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.git_storage.name
  storage_account_access_key = azurerm_storage_account.git_storage.primary_access_key
  service_plan_id            = azurerm_service_plan.gitcreate.id

  site_config {}
}
