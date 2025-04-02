terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "main" {
  name     = "${var.environment}-${var.project_name}-rg"
  location = var.location
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

module "networking" {
  source = "../../modules/networking"
  
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  environment         = var.environment
  address_space       = var.address_space
}

module "compute" {
  source = "../../modules/compute"
  
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  environment         = var.environment
  subnet_id           = module.networking.subnet_id
  vm_size             = "Standard_B1s"
}

module "app_service" {
  source = "../../modules/app_service"
  
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  environment         = var.environment
  app_service_sku     = var.app_service_sku
  app_service_instances = var.app_service_instances
}