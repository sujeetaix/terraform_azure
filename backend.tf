terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraform761"
    container_name       = "tfstate"
    key                  = "default.terraform.tfstate"
  }
}
