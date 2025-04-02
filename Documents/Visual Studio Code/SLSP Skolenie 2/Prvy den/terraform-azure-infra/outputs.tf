output "resource_group_id" {
  value       = azurerm_resource_group.main.id
  description = "ID vytvorenej resource group"
}

output "vnet_id" {
  value       = module.networking.vnet_id
  description = "ID vytvorenej virtuálnej siete"
}

output "vm_id" {
  value       = module.compute.vm_id
  description = "ID vytvoreného virtuálneho stroja"
}

# Výstupy z externého storage modulu
output "storage_account_id" {
  value       = module.storage.storage_account_id
  description = "ID vytvoreného storage účtu"
}

output "storage_account_name" {
  value       = module.storage.storage_account_name
  description = "Názov vytvoreného storage účtu"
}

output "container_ids" {
  value       = module.storage.container_ids
  description = "ID vytvorených kontajnerov"
}
