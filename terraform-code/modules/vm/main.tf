resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.aks_location
  resource_group_name = var.rg_aks_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.integration_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_aks_name
  location            = var.aks_location
  size = "Standard_D2s_v3"

  admin_username = "adminuser"

  disable_password_authentication = false
  admin_password                  = "P@ssword1234!"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}