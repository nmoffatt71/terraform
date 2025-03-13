terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.22.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }
  }
  backend "azurerm" {

  }
}

provider "azurerm" {
  subscription_id = "d3e96fd8-77e3-4cfa-9513-27887363cc75"
  features {}
}
