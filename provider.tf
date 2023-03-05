terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = $MY_CRED_CLIENT_ID
  client_secret   = $MY_CRED_CLIENT_SECRET
  tenant_id       = $MY_CRED_TENANT_ID
  subscription_id = $MY_CRED_SUBSCRIPTION_ID
}

