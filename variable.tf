variable "resource_group_name" {
  default = "Unix-Team-RG"
}

variable "location" {
  default = "ukwest"
}

variable "virtual_network" {
  default = "web-tier"
}
variable "public_ip" {
  default = "PublicIP"
}
variable "subnet_name" {
  default = "web-tier-sn"
}

variable "Network_interface_name" {
  default = "web-nic"
}

variable "Network_security_group_name" {
  default = "web-tier-nsg"
}

variable "Tags_enviroment" {
  type    = string
  default = "Dev Terraform Build"
}
