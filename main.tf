resource "azurerm_resource_group" "main" {
  name     = "${var.env}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.env}-vnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "public" {
  name                 = "${var.env}-public-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.public-subnet
  }

resource "azurerm_subnet" "private" {
  name                 = "${var.env}-private-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.private-subnet
  }

#resource "azurerm_network_security_group" "public" {
#  name                = "acceptanceTestSecurityGroup1"
#  location            = azurerm_resource_group.main.location
#  resource_group_name = azurerm_resource_group.main.name
#}

#resource "azurerm_network_security_group" "private" {
#  name                = "acceptanceTestSecurityGroup1"
#  location            = azurerm_resource_group.main.location
#  resource_group_name = azurerm_resource_group.main.name
#}




