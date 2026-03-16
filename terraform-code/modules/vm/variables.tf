variable "vm_name" {}
variable "vnet_name" {}
variable "vnet_cidr" {}
variable "subnet1_name" {}
variable "subnet1_cidr" {}
variable "integration_subnet_id" {}
variable "rg_aks_name" {
  type = string
}

variable "aks_location" {
  type = string
}