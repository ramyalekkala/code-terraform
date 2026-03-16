

############################################
# App Service Plan
############################################

resource "azurerm_service_plan" "plan" {
  name                = "appservice-plan"
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = "B1"
}

############################################
# Application Insights
############################################

resource "azurerm_application_insights" "appinsights" {
  name                = "demo-appinsights"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = "web"
}

############################################
# App Service
############################################

resource "azurerm_linux_web_app" "webapp" {
  name                = "demo-webapp"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.plan.id
  identity {
    type = "SystemAssigned"
  }

  site_config {}

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.appinsights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.appinsights.connection_string
    SQL_PASSWORD = "@Microsoft.KeyVault(SecretUri=${var.sql_admin_password_secret_id})"

  }
}


