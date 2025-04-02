output "vm_id" {
  value       = azurerm_linux_virtual_machine.main.id
  description = "ID vytvoreného virtuálneho stroja"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.main.ip_address
  description = "Verejná IP adresa virtuálneho stroja"
}
