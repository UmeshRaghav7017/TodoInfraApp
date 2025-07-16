data "azurerm_public_ip" "NICPIP" {
  name                = var.frontend_ip_name
  resource_group_name = var.Nic-rg1
}

data "azurerm_subnet" "fsubnet"{
    name = var.subnet_name
     resource_group_name = var.Nic-rg1
     virtual_network_name= var.vnet_name
}