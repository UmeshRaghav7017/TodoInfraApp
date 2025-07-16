resource "azurerm_key_vault" "kv" {
  name                        = var.Kv-name
  location                    = var.rg-location
  resource_group_name         = var.rg-name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.retention_days
  purge_protection_enabled    = false
  sku_name = "standard"
 enable_rbac_authorization   = true   # ✅ THIS IS IMPORTANT


}