// Create an output of the NSG Name
output "tenant-nsg-id" {
  value = azurerm_network_security_group.tenant-network-security-group.id
}