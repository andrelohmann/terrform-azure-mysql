resource "azurerm_network_interface" "mysql_stack" {
    name                = "${var.name}-bastion-nic"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.mysql_stack.name}"
    network_security_group_id = "${azurerm_network_security_group.mysql_stack.id}"

    ip_configuration {
        name                          = "${var.name}"
        subnet_id                     = "${azurerm_subnet.mysql_stack.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.mysql_stack.id}"
    }

    tags = {
        environment = "${var.environment}"
    }
}
