resource "azurerm_storage_account" "mysql_stack" {
    name                = "diag${random_id.randomId.hex}"
    resource_group_name = "${azurerm_resource_group.mysql_stack.name}"
    location            = "${var.location}"
    account_replication_type = "LRS"
    account_tier = "Standard"

    tags = {
        environment = "${var.environment}"
        bastion     = "${var.name}"
    }
}
