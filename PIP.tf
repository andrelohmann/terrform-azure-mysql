resource "azurerm_public_ip" "TestPIP" {
    name                         = "TestPIP"
    location                     = "${var.location}"
    resource_group_name          = "${azurerm_resource_group.TestRG.name}"
    allocation_method            = "Dynamic"

    tags {
        environment = "Terraform Demo"
    }
}
