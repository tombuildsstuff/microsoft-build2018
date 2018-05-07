provider "azurerm" {
  version = "=1.4.0"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "ssh-key" {
  source = "./modules/ssh-key"
}

module "kubernetes-cluster" {
  source                          = "./modules/kubernetes-cluster"
  prefix                          = "${var.prefix}"
  resource_group_name             = "${azurerm_resource_group.main.name}"
  location                        = "${azurerm_resource_group.main.location}"
  admin_username                  = "microsoftbuild"
  admin_public_ssh_key            = "${module.ssh-key.public_ssh_key}"
  agents_count                    = 3
  agents_size                     = "Standard_F2"
  service_principal_client_id     = "${var.kubernetes_client_id}"
  service_principal_client_secret = "${var.kubernetes_client_secret}"
  tags                            = "${var.tags}"
}

module "redis-cache" {
  source              = "./modules/redis-cache"
  prefix              = "${var.prefix}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${azurerm_resource_group.main.location}"
}

output "aks-connection-instructions" {
  value = "${module.kubernetes-cluster.connection_instructions}"
}
