terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.73.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "wga-rg"
    storage_account_name = "wgatfstatesa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

#Create Resource Group
resource "azurerm_resource_group" "wgademorg" {
  name     = "wga-demo-rg"
  location = "westeurope"
}
