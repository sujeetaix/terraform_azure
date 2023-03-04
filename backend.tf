terraform {
  backend "azurerm" {
    resource_group_name  = "terrafom"
    storage_account_name = "terraform460"
    container_name       = "tfstate"
    key                  = "default.terraform.tfstate"
  }
}