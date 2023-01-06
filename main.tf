terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }

  }

  backend "azurerm" {
    storage_account_name = "tfstate9926"
    container_name       = "tfstate"
    key                  = "path/to/terraform.tfstate"
  }
}

provider "azurerm" {

  features {

  }

}

data "azurerm_resource_group" "exemple" {
  name = "github-action-rg"

}

resource "azurerm_storage_account" "example" {
  name                     = "githubactions11"
  resource_group_name      = data.azurerm_resource_group.exemple.name
  location                 = data.azurerm_resource_group.exemple.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

}
