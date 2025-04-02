resource "azurerm_public_ip" "main" {
  name                = "${var.environment}-vm-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.environment}-vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = "${var.environment}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  
  # Použitie hesla namiesto SSH kľúča
  admin_password      = "P@ssw0rd1234!"
  disable_password_authentication = false
  
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }
}