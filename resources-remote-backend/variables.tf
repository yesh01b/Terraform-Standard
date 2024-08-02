## General variables

variable "subscription_id" {
  type        = string
  description = "The subscription ID where we are deploying the resources"
}
variable "rg_name" {
  type = string
  description = "Resource group name where we are deploying the resources into"
}
variable "location" {
  type = string
  description = "The location where the resource is deploying"
}