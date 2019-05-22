# Configure the Microsoft Azure Provider
provider "azurerm" { }

# All service pricipal credentials need to be set as Terraform Environment Variables
# export ARM_ENVIRONMENT={{ azure_environment }}
# export ARM_TENANT_ID={{ azure_tenant_id }}
# export ARM_SUBSCRIPTION_ID={{ azure_subscription_id }}
# export ARM_CLIENT_ID={{ azure_client_id }}
# export ARM_CLIENT_SECRET={{ azure_client_secret }}
