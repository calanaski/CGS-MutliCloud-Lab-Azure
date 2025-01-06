module "network" {
  source    = "../modules/network/"

  //Network Variables
  tenant-rg-net-name                  = module.compute.tenant-rg-net-name
  tenant-nsg-id                       = module.security.tenant-nsg-id
  tenant-subscription                 = var.tenant-subscription
  sharedservice-subscription          = var.sharedservice-subscription
  tenant-location                     = var.tenant-location
  cloud-name                          = var.cloud-name
  tenant-uic                          = var.tenant-uic
  tenant-application-name             = var.tenant-application-name
  tenant-command                      = var.tenant-command
  tenant-environment-name             = var.tenant-environment-name
  tenant-environment-abbreviation     = var.tenant-environment-abbreviation
  tenant-environment-impactlevel      = var.tenant-environment-impactlevel
  tenant-vnet-cidr-block              = var.tenant-vnet-cidr-block
  tenant-subnets                      = var.tenant-subnets
  sharedservice-defaultroute-gateway  = var.sharedservice-defaultroute-gateway
  sharedservice-dns-servers           = var.sharedservice-dns-servers
}

module "compute" {
  source    = "../modules/compute/"
  
  //Compute Variables
  tenant-subnet-ids                   = module.network.tenant-subnet-ids
  tenant-subscription                 = var.tenant-subscription
  sharedservice-subscription          = var.sharedservice-subscription
  tenant-location                     = var.tenant-location
  cloud-name                          = var.cloud-name
  tenant-uic                          = var.tenant-uic
  tenant-application-name             = var.tenant-application-name
  tenant-command                      = var.tenant-command
  tenant-environment-name             = var.tenant-environment-name
  tenant-environment-abbreviation     = var.tenant-environment-abbreviation
  tenant-environment-impactlevel      = var.tenant-environment-impactlevel
  tenant-vnet-cidr-block              = var.tenant-vnet-cidr-block 
  tenant-subnets                      = var.tenant-subnets
  sharedservice-defaultroute-gateway  = var.sharedservice-defaultroute-gateway
  sharedservice-dns-servers           = var.sharedservice-dns-servers
}

module "security" {
  source    = "../modules/security/"

  //Security Variables
  tenant-rg-net-name                  = module.compute.tenant-rg-net-name
  tenant-rg-core-name                 = module.compute.tenant-rg-core-name
  tenant-subscription                 = var.tenant-subscription
  sharedservice-subscription          = var.sharedservice-subscription
  tenant-location                     = var.tenant-location
  cloud-name                          = var.cloud-name
  tenant-uic                          = var.tenant-uic
  tenant-application-name             = var.tenant-application-name
  tenant-command                      = var.tenant-command
  tenant-environment-name             = var.tenant-environment-name
  tenant-environment-abbreviation     = var.tenant-environment-abbreviation
  tenant-environment-impactlevel      = var.tenant-environment-impactlevel
  tenant-vnet-cidr-block              = var.tenant-vnet-cidr-block 
  tenant-subnets                      = var.tenant-subnets
  sharedservice-defaultroute-gateway  = var.sharedservice-defaultroute-gateway
  sharedservice-dns-servers           = var.sharedservice-dns-servers
}

module "database" {
  source    = "../modules/database/"

  //Database Variables
  tenant-subscription                 = var.tenant-subscription
  sharedservice-subscription          = var.sharedservice-subscription
  tenant-location                     = var.tenant-location
  cloud-name                          = var.cloud-name
  tenant-uic                          = var.tenant-uic
  tenant-application-name             = var.tenant-application-name
  tenant-command                      = var.tenant-command
  tenant-environment-name             = var.tenant-environment-name
  tenant-environment-abbreviation     = var.tenant-environment-abbreviation
  tenant-environment-impactlevel      = var.tenant-environment-impactlevel
  tenant-vnet-cidr-block              = var.tenant-vnet-cidr-block 
  tenant-subnets                      = var.tenant-subnets
  sharedservice-defaultroute-gateway  = var.sharedservice-defaultroute-gateway
  sharedservice-dns-servers           = var.sharedservice-dns-servers
}