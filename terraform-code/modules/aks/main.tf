resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.aks_location
  resource_group_name = var.rg_aks_name
  dns_prefix          = "aksdevops"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = var.app_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
  network_profile {
    network_plugin = "azure"
    service_cidr   = "172.16.0.0/16"
    dns_service_ip = "172.16.0.10"
  }
}

