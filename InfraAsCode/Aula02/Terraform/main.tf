terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "as02-rg" {
    name     = "rg"
    location = "eastus"
}

resource "azurerm_virtual_network" "as02-vnet" {
  name                = "vnet"
  location            = azurerm_resource_group.as02-rg.location
  resource_group_name = azurerm_resource_group.as02-rg.name
  address_space       = ["10.0.0.0/16"]
   
  tags = {
    environment = "Production"
  }
}