output "vnet_id" {
  value       = azurerm_virtual_network.main.id
  description = "ID vytvorenej virtuálnej siete"
}

output "subnet_id" {
  value       = azurerm_subnet.main.id
  description = "ID vytvoreného subnetu"
}

output "nsg_id" {
  value       = azurerm_network_security_group.main.id
  description = "ID vytvorenej network security group"
}
