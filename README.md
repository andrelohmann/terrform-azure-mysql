# terrform-azure-mysql

Run an azure database for mysql without public access and access the database using a ssh tunnel on a bastian host.

copy terraform.tfvars.example to terraform.tfvars and alternate as needed.

set the mysql_virtual_network_rules for database access from thirdparty subnets.
