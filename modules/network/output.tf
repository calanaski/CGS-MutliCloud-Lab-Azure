// Create an output of the Subnet Name
output "tenant-subnet-ids" {
  value = azurerm_subnet.tenant-subnets[0].id
  //value = ["${azurerm_subnet.tenant-subnets.*.id}"]
}