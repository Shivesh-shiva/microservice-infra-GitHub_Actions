locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}

module "resource_groups" {
  source          = "../../modules/resource_group"
  resource_groups = var.infra_config.resource_groups
}

module "acr" {
  source = "../../modules/acr"
  container_registries = {
    for k, v in var.infra_config.container_registries : k => {
      resource_group_name = module.resource_groups.resource_group_names[v.rg_key]
      location            = var.infra_config.resource_groups[v.rg_key].location
      sku                 = v.sku
      admin_enabled       = v.admin_enabled
      tags                = v.tags
    }
  }
}

module "aks" {
  source = "../../modules/aks"
  kubernetes_clusters = {
    for k, v in var.infra_config.kubernetes_clusters : k => {
      resource_group_name = module.resource_groups.resource_group_names[v.rg_key]
      location            = var.infra_config.resource_groups[v.rg_key].location
      dns_prefix          = v.dns_prefix
      default_node_pool   = v.default_node_pool
      tags                = v.tags
    }
  }
}

module "pip" {
  source   = "../../modules/azurerm_public_ip"
  pip_name = "pip-dev-todoapp"
  rg_name  = "rg-dev-todoapp-01"
  location = "centralindia"
  sku      = "Basic"
  tags     = local.common_tags
}