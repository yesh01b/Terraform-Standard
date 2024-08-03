## Resource group - Virtual network

resource "azurerm_resource_group" "rg_vnet" {
  name     = var.rg_vnet_name
  location = var.location
}