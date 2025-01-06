//Static variables that should not change often
sharedservice-subscription          = "873f87c6-be23-4cd5-9b6f-33a77bb67cb3"  //Subscription ID of the VDSS
sharedservice-defaultroute-gateway  = "10.100.0.71" //The address of the Palo Altos to send the default route to
sharedservice-dns-servers           = ["168.63.129.16"] //This should list the servers that provide DNS for the tenants
cloud-name                          = "CAZ"
tenant-environment-name             = "dev"
tenant-environment-abbreviation     = "D"


//Variables that need to be changed for each tenant/environment
//Subscription Info
tenant-subscription                 = "873f87c6-be23-4cd5-9b6f-33a77bb67cb3" //should be utilized in Terraform Enterprise Environment Variables
tenant-location                     = "eastus2" //Region where the tenant will be deployed

//IP Information
tenant-vnet-cidr-block              = ["10.201.0.0/22"] //should be considered in Terraform Enterprise Environment Variables
tenant-subnets = [
  {
    subnet_address                  = ["10.201.0.0/25"] //should be considered in Terraform Enterprise Environment Variables
    subnet_name                     = "Web"
  },
  {
    subnet_address                  = ["10.201.1.0/25"] //should be considered in Terraform Enterprise Environment Variables
    subnet_name                     = "Application"
  },
  {
    subnet_address                  = ["10.201.2.0/25"] //should be considered in Terraform Enterprise Environment Variables
    subnet_name                     = "Database"
  }
]

//Naming Items
tenant-command                      = "HQDA" //should be considered in Terraform Enterprise Environment Variables
tenant-uic                          = "ABCDEF" //should be considered in Terraform Enterprise Environment Variables
tenant-application-name             = "TENANTAPPNAME" //should be considered in Terraform Enterprise Environment Variables
tenant-environment-impactlevel      = "IL4" //should be considered in Terraform Enterprise Environment Variables
