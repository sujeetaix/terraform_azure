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
  client_id       = f89358b8-5376-4ab2-a4e6-543427e42f39
  client_secret   = 2c2d13d7-666c-41ac-8359-08d7520748e3

  features {}
}

