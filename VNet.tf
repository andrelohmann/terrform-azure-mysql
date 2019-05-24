resource "azurerm_virtual_network" "mysql_stack" {
    name                = "${var.name}-bastion-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.mysql_stack.name}"

    tags = {
        environment = "${var.environment}"
    }
}

resource "azurerm_subnet" "mysql_stack" {
    name                 = "${var.name}-bastion-subnet"
    resource_group_name  = "${azurerm_resource_group.mysql_stack.name}"
    virtual_network_name = "${azurerm_virtual_network.mysql_stack.name}"
    address_prefix       = "10.0.2.0/24"
    service_endpoints    = ["Microsoft.Sql"]
}
