terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.48.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

//Provider for Tenant Items
provider "azurerm" {
  subscription_id = var.tenant-subscription
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

//Provider for Shared Services Items
provider "azurerm" {
  alias                       = "sharedservices"
  subscription_id             = var.sharedservice-subscription
  skip_provider_registration  = true
  features {}
}

provider "random" {}