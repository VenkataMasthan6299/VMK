provider "azurerm" {
  features {

  }
}
resource "azurerm_resource_group" "RG" {
name = "RG_TERRAFORM-VENKAT"
location = "Canada Central"
}