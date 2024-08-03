## General variables

variable "subscription_id" {
  type        = string
  description = "The subscription ID where we are deploying the resources"
  default = "c4c44e31-c0c8-401b-824e-3fba6c4e6b68"
}
variable "rg_name" {
  type = string
  description = "Resource group name where we are deploying the resources into"
  default = "rg-dev-01"
}
variable "location" {
  type = string
  description = "The location where the resource is deploying"
  default = "uksouth"
}

## Networking variables

variable "rg_vnet_name" {
  type = string
  description = "Resource group for networking related resources"
  default = "rg-vnet-dev-01"
}