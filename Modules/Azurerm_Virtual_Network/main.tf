resource "azurerm_virtual_network" "Vnet1" {
    name= var.vnet-name
    location = var.vnet-location
    resource_group_name = var.vnet-rg
    address_space = var.vnet-address_space
  
}

# 🔄 Summary (Hindi mai):
# Pehle repo ko clone karo agar already nahi kiya hai.

# git fetch se remote branches lao.

# # git checkout feature se feature branch par switch karo. 
# Agar branch local me nahi hai to git checkout -b feature origin/feature use karo.