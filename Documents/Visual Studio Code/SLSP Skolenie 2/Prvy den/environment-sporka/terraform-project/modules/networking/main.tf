resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  
  tags = {
    Environment = var.environment
  }
}

resource "azurerm_subnet" "main" {
  name                 = "${var.environment}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}