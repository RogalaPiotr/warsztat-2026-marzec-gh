module "rg" {
  source   = "./modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source              = "./modules/virtual-network"
  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.rg.name
  address_space       = var.vnet_address_space
  tags                = var.tags

  depends_on = [module.rg]
}

module "subnet" {
  source               = "./modules/subnet"
  name                 = var.subnet_name
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
  address_prefixes     = var.subnet_address_prefixes

  depends_on = [module.vnet]
}

module "nic" {
  source              = "./modules/network-interface"
  name                = var.nic_name
  location            = var.location
  resource_group_name = module.rg.name
  subnet_id           = module.subnet.id
  tags                = var.tags

  depends_on = [module.subnet]
}

module "sa" {
  source              = "./modules/storage-account"
  name                = var.storage_account_name
  location            = var.location
  resource_group_name = module.rg.name
  tags                = var.tags

  depends_on = [module.rg]
}
