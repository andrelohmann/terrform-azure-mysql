/**
 * MySQL Server
 */
output "mysql_server_id" {
  value = azurerm_mysql_server.mysql_stack.id
}

output "mysql_server_fqdn" {
  value = azurerm_mysql_server.mysql_stack.fqdn
}

/**
 * Bastion host
 */
output "bastion_public_ip" {
  value = azurerm_public_ip.mysql_stack.ip_address
}
