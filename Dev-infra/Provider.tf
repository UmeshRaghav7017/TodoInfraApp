terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }

}

provider "azurerm" {
  features {}
  subscription_id = "437f4835-1892-425c-b825-0df58a04808d"
}