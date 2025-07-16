resource "azurerm_resource_group" "TodoApp-Rg" {
    name=var.ChildRg-name
    location = var.ChildRg-location
}