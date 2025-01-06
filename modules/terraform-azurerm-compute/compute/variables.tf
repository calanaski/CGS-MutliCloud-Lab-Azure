variable "tenant-subscription" {
  type = string
}
variable "sharedservice-subscription" {
  type = string
}

//Regions and Such
variable "tenant-location" {
  type = string
}

//IP Information
variable "tenant-vnet-cidr-block" {
  type = list
}
variable "tenant-subnets" {
  type = list(object({
    subnet_name = string
    subnet_address = list(string)
  }))
}
variable "sharedservice-defaultroute-gateway" {
  type = string
}
variable "sharedservice-dns-servers" {
  type = list
}

//Naming Items
variable "cloud-name" {
  type = string
}
variable "tenant-command" {
  type = string
}
variable "tenant-uic" {
  type = string
}
variable "tenant-application-name" {
  type = string
}
variable "tenant-environment-name" {
  type = string
}
variable "tenant-environment-abbreviation" {
  type = string
}
variable "tenant-environment-impactlevel" {
  type = string
}
variable "tenant-environments" {
    description = "Listing of Environments"
    default = ["dev","test","prod"]
    type = list
}
variable "tenant-subnet-ids" {
  type = string
}