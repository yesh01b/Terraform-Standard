## Terraform - Azure version - DBR 

terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 2.26"
    }
    databricks = {
        source = "databricks/databricks"
    }
  }
}

# provider "databricks" {
#   alias = "databricks-01"
#   host = ""
#   azure_client_id = ""
#   azure_client_secret = ""
#   azure_tenant_id = ""
# }

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
    private_subnet_name = azurerm_subnet.snet_dbr_private.name
    public_subnet_name = azurerm_subnet.snet_dbr_public.name
    no_public_ip = true
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.dbr_private_snet.id
    public_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.dbr_public_snet.id
  }
}

## DBR - cluster

# resource "databricks_cluster" "dbr_cluster" {
#   provider = databricks.databricks-01
#   cluster_name = "test"
#   spark_version = "14.3.x-scala2.12"
#   node_type_id = "standard_DS3_V2"
#   autotermination_minutes = "30"
#   autoscale {
#     min_workers = "2"
#     max_workers = "8"
#   }
#   spark_env_vars = {
#     "instance" = "01"
#     "env" = "dev"
#   }

#   ## Create Libraries

#   library {
#     pypi {
#       package = "pyodbc"
#     }
#   }
#   library {
#     pypi {
#       package = "pycryptodome==3.15.0"
#     }
#   }
#   library {
#     pypi {
#       package = "pypi.org"
#     }
#   }
# }