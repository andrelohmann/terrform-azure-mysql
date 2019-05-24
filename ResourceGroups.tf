resource "azurerm_resource_group" "mysql_stack" {
    name     = "${var.name}"
    location = "${var.location}"

    tags = {
        environment = "${var.environment}"
    }
}
