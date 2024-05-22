locals {
  resource_group_name = format("rg-%s-%s-%s-%s", var.workload, var.env, var.loc, var.instance)
}

## Resource Group

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
}