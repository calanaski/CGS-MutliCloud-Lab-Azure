//Create Resource Groups
resource "azurerm_resource_group" "tenant-rg-net" {
    name        = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-rgp-net")
    location    = var.tenant-location

    tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = title(var.tenant-environment-name)
        TenantImpactLevel           = var.tenant-environment-impactlevel
    }

}

resource "azurerm_resource_group" "tenant-rg-core" {
    name        = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-rgp-core")
    location    = var.tenant-location

    tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = title(var.tenant-environment-name)
        TenantImpactLevel           = var.tenant-environment-impactlevel
    }

}

resource "azurerm_resource_group" "tenant-rg-networkwather" {
     name        					= "${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-rgp-NetworkWathcerRG"
     location    					= var.tenant-location

     tags = {
        TenantCommand               = var.tenant-command
        TenantUIC                   = var.tenant-uic
        TenantApplication           = var.tenant-application-name
        TenantEnvironment           = title(var.tenant-environment-name)
        TenantImpactLevel           = var.tenant-environment-impactlevel
     }
}
/*
//This is for demo purposes of testing how things worked after deployment.  This file should be deleted after completion of testing!

resource "azurerm_network_interface" "testserver" {
  name                = "tenat1testserver-nic"
  location            = azurerm_resource_group.tenant-rg-core.location
  resource_group_name = azurerm_resource_group.tenant-rg-core.name

  ip_configuration {
    name                          = "internal"
    //subnet_id                     = azurerm_subnet.tenant-subnets[0].id
    subnet_id                     = var.tenant-subnet-ids //need to figure out how to index this from outputs.
     private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "testserver" {
  depends_on=[azurerm_network_interface.testserver]
  location              = azurerm_resource_group.tenant-rg-core.location
  resource_group_name   = azurerm_resource_group.tenant-rg-core.name
  name                  = upper("${var.cloud-name}-${var.tenant-application-name}-${var.tenant-environment-abbreviation}-bastion")
  network_interface_ids = [azurerm_network_interface.testserver.id]
  size                  = "Standard_B2ms"
  
  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9-gen2"    
    version   = "latest"
  }
  
  os_disk {
    name                 = "tenat1testserver-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  computer_name  = "tenat1testserver"
  admin_username = "mjohnsonroot"
  admin_password = "SuperSecret2023"
  //custom_data    = base64encode(data.template_file.linux-vm-cloud-init.rendered)
  disable_password_authentication = false
}
*/