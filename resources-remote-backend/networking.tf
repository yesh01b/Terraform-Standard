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

## Subnet - Databricks - public

resource "azurerm_subnet" "snet_dbr_public" {
  name                 = var.subnet_dbr_public_name
  resource_group_name  = azurerm_resource_group.rg_vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.dbr_public_address_prefixes
}
resource "azurerm_subnet" "snet_dbr_private" {
  name                 = var.subnet_dbr_private_name
  resource_group_name  = azurerm_resource_group.rg_vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.dbr_private_address_prefixes
}