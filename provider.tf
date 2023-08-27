terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {

  subscription_id = a7722c19-04cb-44e4-97d9-1829e898c977
  tenant_id       = fa97aabc-9b54-4b0d-afa8-bdabd8afb40b
  client_id       = var.dev_client_id
  client_secret   = var.dev_client_secret

  features {}
}

