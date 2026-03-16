

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  key_vault_id = var.keyvault_id
}



#########################################
 #SQL SERVER CREATION
#########################################
resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"

  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_admin_password

  public_network_access_enabled = false
}
#########################################
#SQL DATABASE
#########################################
resource "azurerm_mssql_database" "database" {
    name = var.database_name
    server_id = azurerm_mssql_server.sqlserver.id
    sku_name = "Basic"
}
