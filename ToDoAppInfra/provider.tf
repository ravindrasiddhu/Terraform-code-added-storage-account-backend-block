terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }

  # backend "azurerm" {
  #   # use_azuread_auth     = true
  #   # tenant_id            = "628588a9-979d-4f6a-ac82-bea62d285c23"
  #   resource_group_name  = "todo-app-rg"
  #   storage_account_name = "todoappstorage1"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # } 

  # backend "azurerm" {
  #   use_cli              = true                                    # Can also be set via `ARM_USE_CLI` environment variable.
  #   use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
  #   tenant_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
  #   storage_account_name = "abcd1234"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
  #   container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
  #   key                  = "prod.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  # }

}

provider "azurerm" {
  features {}
  subscription_id = "e8ad8a11-5e89-4545-9309-27ed1a0cd62f"
}