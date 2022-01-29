# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "web-tier"
  address_space       = ["10.0.0.0/16"]
  location            = "ukwest"
  resource_group_name = "UK-Linux-Team-rg"
}


# Create public IPs
resource "azurerm_public_ip" "publicip" {
    name                         = "PublicIP"
    location                     = "ukwest"
    resource_group_name          = azurerm_resource_group.rg.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Dev IP for web-tier"
    }
}

# Create subnet
resource "azurerm_subnet" "subnet" {
    name                 = "web-tier-sn"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes       = ["10.0.1.0/24"]
}
