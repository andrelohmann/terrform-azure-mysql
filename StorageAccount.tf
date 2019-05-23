resource "azurerm_storage_account" "TestSA" {
    name                = "diag${random_id.randomId.hex}"
    resource_group_name = "${azurerm_resource_group.TestRG.name}"
    location            = "${var.location}"
    account_replication_type = "LRS"
    account_tier = "Standard"

    tags {
        environment = "Terraform Demo"
    }
}
