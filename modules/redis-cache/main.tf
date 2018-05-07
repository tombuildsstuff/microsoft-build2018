resource "azurerm_redis_cache" "main" {
  name                = "${var.prefix}-redis"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false

  redis_configuration {
    maxclients = 1000
  }
}

output "hostname" {
  value = "${azurerm_redis_cache.main.hostname}"
}

output "port" {
  value = "${azurerm_redis_cache.main.ssl_port}"
}

output "primary_access_key" {
  value = "${azurerm_redis_cache.main.primary_access_key}"
}

output "connection_string" {
  value = "${azurerm_redis_cache.main.primary_access_key}@${azurerm_redis_cache.main.hostname}?ssl=true}"
}
