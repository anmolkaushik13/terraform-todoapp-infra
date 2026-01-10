terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "microservice-rg"
    storage_account_name = "microservicstd"
    container_name = "microcontainer"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "de1c1815-4f90-412b-9551-d55f0de9407d"
}
