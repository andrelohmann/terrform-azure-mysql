resource "azurerm_virtual_network" "TestVNet" {
    name                = "TestVNet"
    address_space       = ["10.0.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.TestRG.name}"

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_subnet" "TestSubnet" {
    name                 = "TestSubnet"
    resource_group_name  = "${azurerm_resource_group.TestRG.name}"
    virtual_network_name = "${azurerm_virtual_network.TestVNet.name}"
    address_prefix       = "10.0.2.0/24"
}
