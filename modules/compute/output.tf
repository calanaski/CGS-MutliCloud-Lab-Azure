// Create an output of the Resource Group Name
output "tenant-rg-net-name" {
  value = azurerm_resource_group.tenant-rg-net.name
}

// Create an output of the Resource Group Name
output "tenant-rg-core-name" {
  value = azurerm_resource_group.tenant-rg-core.name
}