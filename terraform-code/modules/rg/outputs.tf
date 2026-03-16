output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}
output "rg_aks_name" {
  value = azurerm_resource_group.aksram_rg.name
}
output "aks_location" {
  value = azurerm_resource_group.aksram_rg.location
}