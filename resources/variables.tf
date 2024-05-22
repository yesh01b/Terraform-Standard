## Subscription ID
variable "subscription_id" {
  type = string
  description = "Subscription ID based on environment. eg: devv - 2222-111111dfd-151515sssf"
  default = "c28f6b93-1215-4e42-942b-3a26679a76bf"
}

## Resource Group

variable "workload" {
  type = string
  description = "Ecosystem names"
  default = "yb"
}
variable "env" {
  type = string
  description = "environment name"
  default = "dev"
}
variable "loc" {
  type = string
  default = "uks"
}
variable "instance" {
  type = string
  default = "01"
}
variable "location" {
  type = string
  default = "uksouth"
}