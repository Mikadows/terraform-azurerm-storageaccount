terraform {
  backend "azurerm" {
    resource_group_name = "RG1"
    storage_account_name = "gsistorageaccount"
    container_name = "terraformcontainer"
    key = ""
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg_azure_tf" {
  name     = "RG1"
//  location = var.azure_location_vara
}


resource "azurerm_storage_account" "storage_azure_tf" {
  name                     = var.azure_storageaccount_name
  resource_group_name      = data.azurerm_resource_group.rg_azure_tf.name
  location                 = data.azurerm_resource_group.rg_azure_tf.location
  account_tier             = var.azure_storageaccount_tier
  account_replication_type = var.azure_storageaccount_replication
}