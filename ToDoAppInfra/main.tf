module "azurerm_resource_group" {
  source   = "../modules/azurerm_resource_group"
  name     = "todo-app-rg"
  location = "centralindia"
}

module "azurerm_virtual_network" {
  depends_on          = [module.azurerm_resource_group]
  source              = "../modules/azurerm_virtual_network"
  vnet_name           = "todo-app-vnet"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
  address_space       = ["10.0.0.0/16"]
}

module "azurerm_subnet_frontend" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "todo-app-frontend-subnet"
  virtual_network_name = "todo-app-vnet"
  resource_group_name  = "todo-app-rg"
  address_prefixes     = ["10.0.1.0/24"]
}

module "azurerm_subnet_backend" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "todo-app-backend-subnet"
  virtual_network_name = "todo-app-vnet"
  resource_group_name  = "todo-app-rg"
  address_prefixes     = ["10.0.2.0/24"]
}

module "azurerm_public_ip_frontend" {
  depends_on          = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source              = "../modules/azurerm_public_ip"
  name_pip            = "todo-app-pip-frontend"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
  allocation_method   = "Static"
}

module "azurerm_public_ip_backend" {
  depends_on          = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source              = "../modules/azurerm_public_ip"
  name_pip            = "todo-app-pip-backend"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
  allocation_method   = "Static"
}

module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../modules/azurerm_key_vault"

  key_vault_name      = "todo-app-kv"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
}

module "frontend_vm" {
  depends_on = [module.azurerm_subnet_frontend, module.azurerm_key_vault, module.azurerm_public_ip_frontend]
  source     = "../modules/azurerm_virtual_machine"

  resource_group_name        = "todo-app-rg"
  location                   = "centralindia"
  vm_name                    = "todo-app-frontend-vm"
  vm_size                    = "Standard_B1s"
  image_publisher            = "canonical"
  image_sku                  = "minimal-20_04-lts"
  image_offer                = "0001-com-ubuntu-minimal-focal"
  nic_name                   = "todo-app-frontend-nic"
  subnet_name                = "todo-app-frontend-subnet"
  virtual_network_name       = "todo-app-vnet"
  azurerm_public_ip_frontend = "todo-app-pip-frontend"
  admin_username             = "adminuser"
  admin_password             = "Password@123!"
}

module "storage_account" {
  depends_on = [module.azurerm_resource_group]
  source     = "../modules/azurerm_storage_account"

  storage_account_name     = "todoappstorage1"
  location                 = "centralindia"
  resource_group_name      = "todo-app-rg"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

module "storage_container" {
  depends_on = [module.storage_account]
  source     = "../modules/azurerm_storage_container"

  storage_account_name   = "todoappstorage1"
  resource_group_name    = "todo-app-rg"
  storage_container_name = "tfstate"
  container_access_type  = "private"

}
