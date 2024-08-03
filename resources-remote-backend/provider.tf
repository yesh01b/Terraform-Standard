## Microsoft Azure - Provider

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  version         = "= 2.96.0"
}