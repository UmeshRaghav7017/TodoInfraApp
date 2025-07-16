module "resource_group" {
  source           = "../Modules/Azurerm_Resource_Group"
  ChildRg-name     = "TodoApp-Rg"
  ChildRg-location = "centralindia"

}

module "storage_Account" {
  depends_on           = [module.resource_group]
  source               = "../Modules/Azurerm_Storage_Account"
  account-name         = "stoarageinfrarg01"
  storage-location     = "centralindia"
  rg-name              = "TodoApp-Rg"
  account_tier         = "Standard"
  account_replica_type = "LRS"

}

module "azurerm_Vnet" {
  depends_on         = [module.resource_group]
  source             = "../Modules/Azurerm_Virtual_Network"
  vnet-name          = "infra-vnet"
  vnet-location      = "centralindia"
  vnet-rg            = "TodoApp-Rg"
  vnet-address_space = ["10.0.0.0/16"]

}

module "F-subnet" {
  depends_on       = [module.azurerm_Vnet, module.resource_group]
  source           = "../Modules/Azurerm_Frontend_Subnet"
  subnet-name      = "FrontendSubnet"
  subnet-rg        = "TodoApp-Rg"
  vnet-name        = "infra-vnet"
  subnet-addprefix = ["10.0.1.0/24"]

}

module "Public-ip" {
  depends_on       = [module.resource_group]
  source           = "../Modules/Azurerm_PublicIp"
  PipName          = "TodoPip"
  PipRgName        = "TodoApp-Rg"
  PipRgLocation    = "centralindia"
  allocationMethod = "Static"

}

module "Nic_card" {
  depends_on               = [module.Public-ip, module.F-subnet]
  source                   = "../Modules/Azurerm_NIC"
  Nic-name                 = "vmnic"
  Nic-location             = "centralindia"
  Nic-rg1                  = "TodoApp-Rg"
  ipconfig-name            = "internalipconfig"
  privateip-add-allocation = "Dynamic"
  subnet_name              = "FrontendSubnet"
  vnet_name                = "infra-vnet"
  frontend_ip_name         = "TodoPip"

}

module "linux_Vm" { 
    depends_on = [ module.resource_group, module.Nic_card,module.Vm_Key_vault ]
    source = "../Modules/Azurerm_Frontend_VM"
    vm-name="Frontend-vm01"
    vm-location="centralindia"
    vm-rg="TodoApp-Rg"
    vm-size="Standard_F2"
    nic_name = "vmnic"
  key_vault_name   = "VmKeyVault1012"
  usersecretname = "Vmusername"
  passwordsecretname = "VmuserPassword"
}

module "Vm_Key_vault" {
  source = "../Modules/Azurerm_Key_Vault"
  Kv-name="VmKeyVault1012"
  rg-name = "TodoApp-Rg"
  rg-location = "centralindia"
  retention_days = 10
  
}

module "Vmusername" {
  depends_on = [ module.Vm_Key_vault ]
  source = "../Modules/Azurrm_Key_Vault_Secret"
  Adminsecretname = "VmUsername"
  Adminsecretvalue = "AdminUserVm1"
  kv-name = "VmKeyVault1012"
  rg-name = "TodoApp-Rg"
}

module "VmuserPassword" {
  depends_on = [ module.Vm_Key_vault ]
  source = "../Modules/Azurrm_Key_Vault_Secret"
  Adminsecretname = "VmPassword"
  Adminsecretvalue = "FrontendVmPass@1"
  kv-name = "VmKeyVault1012"
  rg-name = "TodoApp-Rg"
}