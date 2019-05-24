resource "azurerm_mysql_server" "mysql_stack" {
  name                = "${lower(var.name)}-${lower(var.mysql_suffix)}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.mysql_stack.name}"

  sku {
    name     = "${var.mysql_sku_tier_map[var.mysql_sku_tier]}_${var.mysql_sku_family}_${var.mysql_sku_capacity}"
    capacity = var.mysql_sku_capacity
    tier     = "${var.mysql_sku_tier}"
    family = "${var.mysql_sku_family}"
  }

  storage_profile {
    storage_mb            = var.mysql_storage_mb
    backup_retention_days = var.mysql_backup_retention_days
    geo_redundant_backup  = "Disabled" # Geo redundancy will be disabled by default
  }

  administrator_login          = "${var.mysql_admin_user}"
  administrator_login_password = "${var.mysql_admin_password}"
  version                      = "${var.mysql_version}"
  ssl_enforcement              = "Enabled"

}

resource "azurerm_mysql_configuration" "mysql_stack" {
  count               = length(keys(var.mysql_configurations))

  name                = element(keys(var.mysql_configurations), count.index)

  resource_group_name = "${azurerm_resource_group.mysql_stack.name}"
  server_name         = "${azurerm_mysql_server.mysql_stack.name}"

  value               = element(values(var.mysql_configurations), count.index)
}

/**
 * create a local variable mysql_virtual_network_rules, to concat mysql_stack subnet_id with global mysql_virtual_network_rules
 */
locals {
  mysql_virtual_network_rules = concat([
    {
      name      = "${var.name}-bastion"
      subnet_id = azurerm_subnet.mysql_stack.id
    }
  ], var.mysql_virtual_network_rules)
}

resource "azurerm_mysql_virtual_network_rule" "mysql_stack" {
  count               = length(local.mysql_virtual_network_rules)

  name                = lookup(element(local.mysql_virtual_network_rules, count.index), "name")

  resource_group_name = "${azurerm_resource_group.mysql_stack.name}"
  server_name         = "${azurerm_mysql_server.mysql_stack.name}"

  subnet_id           = lookup(element(local.mysql_virtual_network_rules, count.index), "subnet_id")
}
