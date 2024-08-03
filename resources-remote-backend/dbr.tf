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

## NSG association for DBR private Subnet

resource "azurerm_subnet_network_security_group_association" "dbr_public_snet" {
  subnet_id = azurerm_subnet.snet_dbr_public.id
  network_security_group_id = azurerm_network_security_group.nsg_dbr_public.id
}