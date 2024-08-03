## Terraform - Azure version - DBR 

terraform {
  required_providers {
    azurerm = {
        source = "haschicorp/azurerm"
        version = ">= 2.26"
    }
    databricks = {
        source = "databricks/databricks"
    }
  }
}

## NSG association for DBR Public Subnet

resource "azurerm_subnet_network_security_group_association" "dbr_public_snet" {
  subnet_id = azurerm_subnet.snet_dbr_public.id
  network_security_group_id = azurerm_network_security_group.nsg_dbr_public.id
}
## NSG association for DBR private Subnet

resource "azurerm_subnet_network_security_group_association" "dbr_private_snet" {
  subnet_id = azurerm_subnet.snet_dbr_private.id
  network_security_group_id = azurerm_network_security_group.nsg_dbr_private.id
}

## Data Bricks Workspace Creation

resource "azurerm_databricks_workspace" "dbr" {
  name = var.dbr_name
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  sku = "standard"
  managed_resource_group_name = var.managed_resource_group_name

  custom_parameters {
    virtual_network_id = azurerm_virtual_network.vnet.id
    private_subnet_name = azurerm_subnet.dbr_private_snet.name
    public_subnet_name = azurerm_subnet.dbr_public_snet.name
    no_public_ip = true
    private_subnet_network_security_group_association = azurerm_subnet_network_security_group_association.dbr_private_snet.id
    public_subnet_network_security_group_association = azurerm_subnet_network_security_group_association.dbr_public_snet.id
  }
}