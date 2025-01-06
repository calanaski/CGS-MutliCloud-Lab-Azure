//Gather existing info (Data Section)

//Get Dev Information
data "azurerm_virtual_network" "sharedservices-dev-vdss-vnet" {
  provider                            = azurerm.sharedservices
  name                                = "vn-cgsephem-vdss"   //This will need to be updated with actuals
  resource_group_name                 = "CGSEPHEM-Provider"  //This will need to be updated with actuals
}
data "azurerm_virtual_network" "sharedservices-vdss-vnet-dev" {
  //provider                            = azurerm.sharedservices
  name                                = "vn-cgsephem-vdss"   //This will need to be updated with actuals
  resource_group_name                 = "CGSEPHEM-Provider"  //This will need to be updated with actuals
}

data "azurerm_resource_group" "sharedservices-dev-vdss-rg" {
  provider                            = azurerm.sharedservices
  name                                = "CGSEPHEM-Provider"  //This will need to be updated with actuals
}

//Get Test Information
data "azurerm_virtual_network" "sharedservices-test-vdss-vnet" {
  provider                            = azurerm.sharedservices
  name                                = "VN-CGS-TEST-VDSS"   //This will need to be updated with actuals
  resource_group_name                 = "CGS-Test-VDSS"  //This will need to be updated with actuals
}
data "azurerm_virtual_network" "sharedservices-vdss-vnet-test" {
  provider                            = azurerm.sharedservices
  name                                = "VN-CGS-TEST-VDSS"   //This will need to be updated with actuals
  resource_group_name                 = "CGS-Test-VDSS"  //This will need to be updated with actuals
}
/*
output "sharedservices-test-vdss-vnet-id" {
  value = data.azurerm_virtual_network.sharedservices-test-vdss-vnet.id
}
*/

data "azurerm_resource_group" "sharedservices-test-vdss-rg" {
  provider                            = azurerm.sharedservices
  name                                = "CGS-Test-VDSS"  //This will need to be updated with actuals
}

//Get Prod Information
data "azurerm_virtual_network" "sharedservices-prod-vdss-vnet" {
  provider                            = azurerm.sharedservices
  name                                = "VN-CGS-PROD-VDSS"   //This will need to be updated with actuals
  resource_group_name                 = "CGS-Prod-VDSS"  //This will need to be updated with actuals
}

data "azurerm_resource_group" "sharedservices-prod-vdss-rg" {
  provider                            = azurerm.sharedservices
  name                                = "CGS-Prod-VDSS"  //This will need to be updated with actuals
}
