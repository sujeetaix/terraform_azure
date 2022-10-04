terraform {
  backend "azurerm" {
    resource_group_name  = "terraformbackend"
    storage_account_name = "votingappterraformstate"
    container_name       = "tfstatefile"
    key                  = "default.terraform.tfstate"
  }
}