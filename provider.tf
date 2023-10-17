terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {

  subscription_id = "a7722c19-04cb-44e4-97d9-1829e898c977"
  tenant_id       = "fa97aabc-9b54-4b0d-afa8-bdabd8afb40b"
  client_id       = "71bfd28a-3b38-46d0-9f40-5b50e82a5539"
  client_secret   = "gRt8Q~2c_G1d1Eero9matX33Is7UwC5GLq.5aaqn"

  features {}
}

