terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Vytvorenie resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    project     = var.project_name
  }
}

# Modul pre networking
module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  environment         = var.environment
  address_space       = var.address_space
}

# Modul pre compute
module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  environment         = var.environment
  subnet_id           = module.networking.subnet_id
  depends_on          = [module.networking]
}

# Použitie externého modulu pre storage zo samostatného repozitára s referenciou na konkrétny tag
module "storage" {
  source = "git::https://gitlab.com/Ceresnak/terraform-azure-storage-module.git?ref=v1.0.0"
  
  name                  = "${var.environment}storage${random_string.suffix.result}"
  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  environment           = var.environment
  project_name          = var.project_name
  container_names       = ["data", "logs", "backups"]
}

# Generovanie náhodného sufixu pre unikátny názov storage účtu
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}