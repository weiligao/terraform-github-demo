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

resource "azurerm_service_plan" "demo" {
  name                = "demo-${random_string.demo.result}-asp"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "demo" {
  name                = "demo-${random_string.demo.result}-app"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  service_plan_id     = azurerm_service_plan.demo.id

  site_config {}
}

resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id   = azurerm_linux_web_app.demo.id
  repo_url = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch   = "master"
}