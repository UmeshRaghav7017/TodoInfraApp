data "azurerm_network_interface""NicCard"{
    name= var.nic_name
    resource_group_name=var.vm-rg  
}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.vm-rg
}

data "azurerm_key_vault_secret" "vm_username" {
  name         = var.usersecretname
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = var.passwordsecretname
  key_vault_id = data.azurerm_key_vault.kv.id
}
