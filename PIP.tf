resource "azurerm_public_ip" "mysql_stack" {
    name                         = "${var.name}-bastion-ip"
    location                     = "${var.location}"
    resource_group_name          = "${azurerm_resource_group.mysql_stack.name}"
    allocation_method            = "Dynamic"

    tags = {
        environment = "${var.environment}"
    }
}
