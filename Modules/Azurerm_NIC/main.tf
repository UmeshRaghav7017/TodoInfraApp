resource "azurerm_network_interface" "NIC" {
  name                = var.Nic-name
  location            = var.Nic-location
  resource_group_name = var.Nic-rg1

  ip_configuration {
    public_ip_address_id = data.azurerm_public_ip.NICPIP.id
    name                          = var.ipconfig-name
    subnet_id                     = data.azurerm_subnet.fsubnet.id
    private_ip_address_allocation = var.privateip-add-allocation
  }
}