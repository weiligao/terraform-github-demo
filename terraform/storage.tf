resource "random_string" "demo" {
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "azurerm_resource_group" "demo" {
  name     = "demo-${random_string.demo.result}-rg"
  location = "westeurope"
}

resource "azurerm_storage_account" "demo" {
  name                     = "demo${random_string.demo.result}storage"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "demo" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.demo.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "demo" {
  name                   = "viscon-logo.png"
  storage_account_name   = azurerm_storage_account.demo.name
  storage_container_name = azurerm_storage_container.demo.name
  type                   = "Block"
  source                 = "viscon-logo.png"
}