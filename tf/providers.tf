variable "oidc_token" {}
variable "oidc_token_file_path" {}
variable "oidc_request_token" {}
variable "oidc_request_url" {}

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
    use_azuread_auth     = true
    use_oidc             = true
    tenant_id            = "5d557c61-2a5a-4d56-9bdc-37464d75f65b"
    client_id            = "90e8ee9c-8b65-4622-9836-c1979c103f97"


  }

  provider "azurerm" {
    features {}
    subscription_id     = "5f003acd-6f4e-444d-b31e-f25a41931ce9"
    storage_use_azuread = true
    # for GitHub Actions
    oidc_request_token = var.oidc_request_token
    oidc_request_url   = var.oidc_request_url

    # for other generic OIDC providers, providing token directly
    oidc_token = var.oidc_token

    # for other generic OIDC providers, reading token from a file
    oidc_token_file_path = var.oidc_token_file_path
  }
}

provider "azuread" {
  tenant_id = "5d557c61-2a5a-4d56-9bdc-37464d75f65b"
}
