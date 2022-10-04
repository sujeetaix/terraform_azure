output "vnetname" {
  value = azurerm_virtual_network.main.name
}
output "vnet_address_space" {
    value = azurerm_virtual_network.main.address_space
}
output "vnet_location" {
    value = azurerm_virtual_network.main.location
}