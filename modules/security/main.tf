//Create Default NSG
resource "azurerm_network_security_group" "tenant-network-security-group" {
    name                            = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-NSG-MAIN")
    resource_group_name             = var.tenant-rg-net-name
    location                        = var.tenant-location
    
    tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = title(var.tenant-environment-name)
        TenantImpactLevel           = var.tenant-environment-impactlevel
    }
}
/*
//Tenant Key Vault
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "tenant-certificate-vault" {
    name                            = upper("${var.tenant-application-name}${var.tenant-environment-abbreviation}KEYCRT")
    resource_group_name             = var.tenant-rg-core-name
    location                        = var.tenant-location
    tenant_id                       = data.azurerm_client_config.current.tenant_id
    enabled_for_deployment          = true
    enabled_for_disk_encryption     = true
    purge_protection_enabled        = true
    sku_name                        = "standard"

    tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = var.tenant-environment-name
        TenantImpactLevel           = var.tenant-environment-impactlevel
    }
}

resource "azurerm_key_vault" "tenant-cmk-vault" {
    name                            = upper("${var.tenant-application-name}${var.tenant-environment-abbreviation}KEYCMK")
    resource_group_name             = var.tenant-rg-core-name
    location                        = var.tenant-location
    tenant_id                       = data.azurerm_client_config.current.tenant_id
    enabled_for_deployment          = true
    enabled_for_disk_encryption     = true
    purge_protection_enabled        = true
    sku_name                        = "standard"

    tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = var.tenant-environment-name
        TenantImpactLevel           = var.tenant-environment-impactlevel
    }
}
*/