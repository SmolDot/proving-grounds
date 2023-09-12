terraform {
  required_version = "~> 1.2"
  # Use these plugins
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.18"
    }
  }

  backend "azurerm" {
    container_name       = "tfwithgit"
    subscription_id      = "5f003acd-6f4e-444d-b31e-f25a41931ce9"
    storage_account_name = "statestorageleroytest"
    key                  = "terraform.tfstate"
    resource_group_name  = "state-access"
    use_oidc             = true
    tenant_id            = "5d557c61-2a5a-4d56-9bdc-37464d75f65b"
  }

}

provider "azurerm" {
  features {}
  subscription_id     = "5f003acd-6f4e-444d-b31e-f25a41931ce9"
  storage_use_azuread = true
}

provider "azuread" {
  tenant_id = "5d557c61-2a5a-4d56-9bdc-37464d75f65b"
}
