terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource group for A09 testing
resource "azurerm_resource_group" "rg" {
  name     = "rg-a09-demo"
  location = "eastus2"
}

resource "azurerm_storage_account" "sa" {
  name                     = "arpita09storage12345"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}