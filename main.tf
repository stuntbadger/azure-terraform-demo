# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.7"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "ukwest"
   tags = {
     Environment = "Terraform Getting Started"
     Team = "DevOps"
   }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "myTFVnet"
    address_space       = ["10.1.0.0/16"]
    location            = "ukwest"
    resource_group_name = azurerm_resource_group.rg.name
}
