variable "vnet_address_space" {
  type = list(string)
}
variable "location" {
  default = "westeurope"
 }
variable "env" { }
variable "public-subnet" { }
variable "private-subnet" { }
variable "subscription_id" { }
variable "client_id" { }
variable "client_secret" { }
variable "tenant_id" { }