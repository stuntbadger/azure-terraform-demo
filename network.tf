# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  depends_on=[azurerm_resource_group.rg]
  name                = var.virtual_network
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}


# Create public IPs
resource "azurerm_public_ip" "publicip" {
    name                         = var.public_ip
    location                     = var.location
    resource_group_name          = azurerm_resource_group.rg.name
    allocation_method            = "Dynamic"

    tags = {
        environment = var.Tags_enviroment
    }
}
data "azurerm_public_ip" "gateway-public-ip" {
    name                        = "${azurerm_public_ip.publicip.name}"
    resource_group_name = azurerm_resource_group.rg.name
}

output "ServerExternalIP" {
   value = "${data.azurerm_public_ip.gateway-public-ip.ip_address}"
}

# Create subnet
resource "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes       = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "web-private-nic" {
  depends_on=[azurerm_resource_group.rg]

  name                = var.Network_interface_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }

}
