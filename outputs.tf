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
data "azurerm_public_ip" "bastion" {
  name                = "${azurerm_public_ip.mysql_stack.name}"
  resource_group_name = "${azurerm_virtual_machine.mysql_stack.resource_group_name}"
}
output "bastion_public_ip" {
  value = "${data.azurerm_public_ip.bastion.ip_address}"
}
