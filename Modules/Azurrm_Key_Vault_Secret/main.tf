resource "azurerm_key_vault_secret" "VmAdminsecret" {
  name         = var.Adminsecretname
  value        = var.Adminsecretvalue
  key_vault_id = data.azurerm_key_vault.Kv_id.id
}

# resource "azurerm_key_vault_secret" "Vm_Password_secret" {
#   name         = var.Password-secret-name
#   value        = var.Password-secret-value
#   key_vault_id = data.azurerm_key_vault.Kv_id.id
# }