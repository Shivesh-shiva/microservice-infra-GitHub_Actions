terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    use_oidc             = true                                    # Can also be set via `ARM_USE_OIDC` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "07b6dcc9-18d6-45a6-b3d3-7183c906e2ba"  # Can also be set via `ARM_TENANT_ID` environment variable.
    client_id            = "ddeaeb75-a7e2-4884-a107-925056ec540e"
    storage_account_name = "twostates"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b107b989-85d9-4402-94e8-40ae932b8893"
}
