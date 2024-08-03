## Resource group - Virtual network

resource "azurerm_resource_group" "rg_vnet" {
  name     = var.rg_vnet_name
  location = var.location
}

## Virtual Network

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg_vnet.location
  resource_group_name = azurerm_resource_group.rg_vnet.name
  address_space       = var.address_space
}