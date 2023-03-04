variable "vnet_address_space" {
  type = list(string)
}
variable "location" {
  default = "eastus"
 }
variable "env" { }
variable "public-subnet" { }
variable "private-subnet" { }

