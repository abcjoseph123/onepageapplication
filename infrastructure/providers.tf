terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


terraform {
  backend "azurerm" {
    resource_group_name   = "state-rg"
    storage_account_name  = "storageaccount"
    container_name        = "terraform-state"
    key                   = "webapp.tfstate"
  }
}