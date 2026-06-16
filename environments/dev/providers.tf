terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "shivesh-rg"
    storage_account_name = "shiveshstorage183"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "b107b989-85d9-4402-94e8-40ae932b8893"
}
