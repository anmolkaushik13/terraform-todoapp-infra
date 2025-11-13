terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pipeline-rg"
    storage_account_name = "akstroge"
    container_name       = "state"
    key                  = "dev.tfstate"
    subscription_id      = "06f4c176-e41e-424a-bfc2-cb4b3a4e5fe5"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "06f4c176-e41e-424a-bfc2-cb4b3a4e5fe5"
}
