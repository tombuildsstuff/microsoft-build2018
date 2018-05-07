resource "azurerm_kubernetes_cluster" "main" {
  name                = "${var.prefix}-kubernetes"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  dns_prefix          = "${var.prefix}k8s"

  linux_profile {
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${replace(var.admin_public_ssh_key, "\n", "")}"
    }
  }

  agent_pool_profile {
    name            = "${lower(var.agents_ostype)}"
    count           = "${var.agents_count}"
    vm_size         = "${var.agents_size}"
    os_type         = "${var.agents_ostype}"
    os_disk_size_gb = 50
  }

  service_principal {
    client_id     = "${var.service_principal_client_id}"
    client_secret = "${var.service_principal_client_secret}"
  }

  tags = "${var.tags}"
}

data "template_file" "instructions" {
  template = "${file("${path.module}/connection-instructions.txt")}"

  vars {
    name                = "${azurerm_kubernetes_cluster.main.name}"
    resource_group_name = "${var.resource_group_name}"
  }
}
