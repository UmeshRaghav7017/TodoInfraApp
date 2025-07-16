resource "azurerm_linux_virtual_machine" "FrontVm1" {
  name                = var.vm-name
  resource_group_name = var.vm-rg
  location            = var.vm-location
  size                = var.vm-size
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password      = data.azurerm_key_vault_secret.vm_password.value
  disable_password_authentication = false

  network_interface_ids = [data.azurerm_network_interface.NicCard.id]

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