# resource "azurerm_resource_group" "rg_01" {
#   name     = var.rg_name
#   location = var.location
# }

data "azurerm_resource_group" "sandbox" {
  name = "1-c644081a-playground-sandbox"
}

output "sandbox_name" {
  value = data.azurerm_resource_group.sandbox.name
}

output "sandbox_location" {
  value = data.azurerm_resource_group.sandbox.location
}