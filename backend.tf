terraform {
  backend "azurerm" {
    resource_group_name  = "terrafom"
    storage_account_name = "terraform760"
    container_name       = "tfstate"
    key                  = "default.terraform.tfstate"
  }
}
