resource "azurerm_resource_group" "TestRG" {
    name     = "TestRG"
    location = "${var.location}"

    tags = {
        environment = "Terraform Demo"
    }
}
