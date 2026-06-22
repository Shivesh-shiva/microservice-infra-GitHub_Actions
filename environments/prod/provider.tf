terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-devopsinsiders"
    storage_account_name = "twostates"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b107b989-85d9-4402-94e8-40ae932b8893"
}
