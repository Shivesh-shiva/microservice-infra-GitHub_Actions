terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    use_oidc             = true
    use_azuread_auth     = true
    tenant_id            = "07b6dcc9-18d6-45a6-b3d3-7183c906e2ba"
    client_id            = "001d55f2-b456-4af2-b966-97580811f90e"
    storage_account_name = "shiveshstorage183"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}
