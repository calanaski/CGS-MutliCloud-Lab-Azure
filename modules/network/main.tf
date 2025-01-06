//Provider for Shared Services Items
provider "azurerm" {
  alias                       = "sharedservices"
  subscription_id             = var.sharedservice-subscription
  skip_provider_registration  = true
  features {}
}

//Variable Setup
locals {
    environment_map = {
        "dev" = data.azurerm_virtual_network.sharedservices-vdss-vnet-dev
        "test" = data.azurerm_virtual_network.sharedservices-vdss-vnet-test
        "prod" = data.azurerm_virtual_network.sharedservices-vdss-vnet-prod
    }
    resourcegroup_map = {
        "dev" = data.azurerm_resource_group.sharedservices-vdss-rg-dev
        "test" = data.azurerm_resource_group.sharedservices-vdss-rg-test
        "prod" = data.azurerm_resource_group.sharedservices-vdss-rg-prod
    }
}

//vNet Creation
resource "azurerm_virtual_network" "tenant-vnet" {
    name                            = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-vnt")
    location                        = var.tenant-location
    resource_group_name             = var.tenant-rg-net-name
    address_space                   = var.tenant-vnet-cidr-block
    dns_servers                     = var.sharedservice-dns-servers

    tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = title(var.tenant-environment-name)
        TenantImpactLevel           = var.tenant-environment-impactlevel
    }
}

//Tenant to VDSS Peering
resource "azurerm_virtual_network_peering" "tenant-vdss-peering" {
    name                            = "${var.tenant-application-name}-To-VDSS${var.tenant-environment-name}"
    //resource_group_name             = azurerm_resource_group.tenant-rg-net.name
    resource_group_name             = var.tenant-rg-net-name
    virtual_network_name            = azurerm_virtual_network.tenant-vnet.name
    remote_virtual_network_id       = local.environment_map[var.tenant-environment-name].id
    allow_virtual_network_access    = true
    allow_forwarded_traffic         = true
    use_remote_gateways             = false //this works for demo environment, but will need to be checked
}

//VDSS to Tenant Peering
resource "azurerm_virtual_network_peering" "vdss-tenant-peering" {
    provider                        = azurerm.sharedservices
    name                            = "${var.tenant-environment-name}-VDSS-To-${var.tenant-application-name}"
    resource_group_name             = local.resourcegroup_map[var.tenant-environment-name].name
    virtual_network_name            = local.environment_map[var.tenant-environment-name].name
    remote_virtual_network_id       = azurerm_virtual_network.tenant-vnet.id
    allow_virtual_network_access    = true
    allow_forwarded_traffic         = true
    allow_gateway_transit           = false //this works for demo environment, but will need to be checked
}

//Subnet Creation
resource "azurerm_subnet" "tenant-subnets" {
    count                           = length(var.tenant-subnets)
    name                            = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-SNT-${var.tenant-subnets[count.index].subnet_name}")
    resource_group_name             = var.tenant-rg-net-name
    virtual_network_name            = azurerm_virtual_network.tenant-vnet.name
    address_prefixes                = var.tenant-subnets[count.index].subnet_address
}

//Create UDR to force traffic to NVA
resource "azurerm_route_table" "tenant-default-route" {
    name                            = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-UDR-MAIN")
    location                        = var.tenant-location
    resource_group_name             = var.tenant-rg-net-name
    disable_bgp_route_propagation   = true

    route {
        name                        = "DEFAULT-TRANSIT"
        address_prefix              = "0.0.0.0/0"
        next_hop_type               = "VirtualAppliance"
        next_hop_in_ip_address      = var.sharedservice-defaultroute-gateway
    }
    
}

//Apply UDR to Subnets
resource "azurerm_subnet_route_table_association" "tenant-subent-udr-association" {
    count                           = length(var.tenant-subnets)
    subnet_id                       = azurerm_subnet.tenant-subnets[count.index].id
    route_table_id                  = azurerm_route_table.tenant-default-route.id
}

//Apply NSG to Subnets
resource "azurerm_subnet_network_security_group_association" "tenant-subnet-nsg-assoication" {
    count                           = length(var.tenant-subnets)
    subnet_id                       = azurerm_subnet.tenant-subnets[count.index].id
    network_security_group_id       = var.tenant-nsg-id
}