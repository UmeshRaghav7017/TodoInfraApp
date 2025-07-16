resource "azurerm_storage_account" "StgtodoApp" {
    name= var.account-name
    location = var.storage-location
    resource_group_name = var.rg-name
    account_tier = var.account_tier
    account_replication_type = var.account_replica_type
  
}