terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
 required_version = ">= 0.14.9"
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstatevzzap"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Create a resource group for network
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

