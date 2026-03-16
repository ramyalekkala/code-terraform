module "rg" {
  source = "../../modules/rg"
   rg_name  = var.rg_name
  location = var.location
  rg_aks_name = var.rg_aks_name
  aks_location = var.aks_location
}

module "network" {
  source = "../../modules/networking"
  rg_aks_name = module.rg.rg_aks_name
  aks_location = module.rg.aks_location
  vnet_name = var.vnet_name
  vnet_cidr = var.vnet_cidr
  subnet1_name = var.subnet1_name
  subnet1_cidr = var.subnet1_cidr
  subnet2_name = var.subnet2_name
  subnet2_cidr = var.subnet2_cidr
  app_subnet_name = var.app_subnet_name
  app_subnet_cidr = var.app_subnet_cidr
}

module "vm" {
  source = "../../modules/vm"
  rg_aks_name = module.rg.rg_aks_name
  aks_location = module.rg.aks_location
  vm_name = var.vm_name
  vnet_name = module.network.vnet_name
  vnet_cidr = module.network.vnet_cidr
  subnet1_name = module.network.subnet1_name
  subnet1_cidr = module.network.subnet1_cidr
  integration_subnet_id = module.network.integration_subnet_id
}

module "keyvault" {
    source = "../../modules/keyvault"
    vault_name = var.vault_name
    sql_admin_password = var.sql_admin_password
    rg_name = module.rg.rg_name
    location = module.rg.location
}
module "aks" {
  source = "../../modules/aks"
  rg_aks_name = module.rg.rg_aks_name
  aks_location = module.rg.aks_location
  aks_cluster_name = var.aks_cluster_name
  app_subnet_id = module.network.app_subnet_id
}
module "database" {
  source = "../../modules/database"
  sqlserver_name = var.sqlserver_name
  database_name = var.database_name
  rg_name = module.rg.rg_name
  location = module.rg.location
  keyvault_id = module.keyvault.keyvault_id
 sql_admin_password = module.keyvault.sql_admin_password
}