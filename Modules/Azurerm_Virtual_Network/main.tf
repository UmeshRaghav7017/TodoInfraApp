resource "azurerm_virtual_network" "Vnet1" {
    name= var.vnet-name
    location = var.vnet-location
    resource_group_name = var.vnet-rg
    address_space = var.vnet-address_space
  
}