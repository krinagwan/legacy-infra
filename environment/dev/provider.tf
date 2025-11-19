terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "value"
  #   storage_account_name = "value"
  #   container_name = "value"
  #   key = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {

  }
  # subscription_id = "ddb23ce9-0db9-442f-9bbd-5a86d4102828"
  subscription_id = "429b06b5-9880-4aa9-b8c4-f771f55a6098"
}