
# It tells terraform that fetch the current logged details-from the azure account
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "myvault" {
  name                        = var.vault_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password-subhadra"
  value        = var.sql_admin_password
  key_vault_id = azurerm_key_vault.myvault.id
  lifecycle {
  ignore_changes = [value]
}
}
