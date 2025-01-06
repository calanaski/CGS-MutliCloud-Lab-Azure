
//Gather existing info (Data Section)

//Get Dev Information
data "azurerm_virtual_network" "sharedservices-vdss-vnet-dev" {
  name                                = "vn-cgsephem-vdss"   //This will need to be updated with actuals
  resource_group_name                 = "CGSEPHEM-Provider"  //This will need to be updated with actuals
}

data "azurerm_resource_group" "sharedservices-vdss-rg-dev" {
  name                                = "CGSEPHEM-Provider"  //This will need to be updated with actuals
}

//Get Test Information
data "azurerm_virtual_network" "sharedservices-vdss-vnet-test" {
  name                                = "VN-CGS-TEST-VDSS"   //This will need to be updated with actuals
  resource_group_name                 = "CGS-Test-VDSS"  //This will need to be updated with actuals
}

data "azurerm_resource_group" "sharedservices-vdss-rg-test" {
  name                                = "CGS-Test-VDSS"  //This will need to be updated with actuals
}

//Get Prod Information
data "azurerm_virtual_network" "sharedservices-vdss-vnet-prod" {
  name                                = "VN-CGS-PROD-VDSS"   //This will need to be updated with actuals
  resource_group_name                 = "CGS-Prod-VDSS"  //This will need to be updated with actuals
}

data "azurerm_resource_group" "sharedservices-vdss-rg-prod" {
  name                                = "CGS-Prod-VDSS"  //This will need to be updated with actuals
}
