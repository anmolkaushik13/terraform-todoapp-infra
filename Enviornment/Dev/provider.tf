terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
backend "azurerm" {
resource_group_name = "dev-rg"
storage_account_name = "todotv"
container_name = "tttt"
key = "terraform.tfstate"
}
}

provider "azurerm" {
  features {}
  subscription_id = "06f4c176-e41e-424a-bfc2-cb4b3a4e5fe5"
}
