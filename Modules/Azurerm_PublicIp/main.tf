resource "azurerm_public_ip" "Pip" {
  name                = var.PipName
  resource_group_name = var.PipRgName
  location            = var.PipRgLocation
  allocation_method   = var.allocationMethod

}