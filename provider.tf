terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "rhbkndrg"
    storage_account_name = "backendstg1"
    container_name       = "stgbkl"
    key                  = "dev.tfstatee"
  } 
}

provider "azurerm" {
  features {}
  subscription_id = "01ea0417-d11f-43fb-abdd-b2f167d94a39"
}
