variable "rg_aks_name" {}
variable "aks_location" {}
variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}
variable "vnet_name" {}
variable "vnet_cidr" {}
variable "subnet1_name" {}
variable "subnet1_cidr" {}
variable "subnet2_name" {}
variable "subnet2_cidr" {}
variable "app_subnet_name" {}
variable "app_subnet_cidr" {}
variable "vm_name" {}
variable "vault_name" {}
variable "sql_admin_password" {}
variable "aks_cluster_name" {}
variable "sqlserver_name" {}
variable "database_name" {}