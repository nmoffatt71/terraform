terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "d3e96fd8-77e3-4cfa-9513-27887363cc75"
}
