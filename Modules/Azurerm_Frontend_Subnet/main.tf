resource "azurerm_subnet" "Fsubnet1" {
    name= var.subnet-name
    resource_group_name = var.subnet-rg
    address_prefixes = var.subnet-addprefix
    virtual_network_name = var.vnet-name
  
}