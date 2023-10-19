terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.76.0"
    }
  }

  # # Remote backend
  # backend "azurerm" {
  #   resource_group_name  = "wga-rg"       # Change to your own resource group name
  #   storage_account_name = "wgatfstatesa" # Change to your own storage account name
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}

  # Uncomment line below in case of provider registration issues
  # skip_provider_registration = true
}