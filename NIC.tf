resource "azurerm_network_interface" "TestNIC" {
    name                = "TestNIC"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.TestRG.name}"
    network_security_group_id = "${azurerm_network_security_group.TestSG.id}"

    ip_configuration {
        name                          = "TestNicConfiguration"
        subnet_id                     = "${azurerm_subnet.TestSubnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.TestPIP.id}"
    }

    tags = {
        environment = "Terraform Demo"
    }
}
