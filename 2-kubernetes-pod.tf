provider "kubernetes" {
  version                = "=1.1.0"
  host                   = "${module.kubernetes-cluster.host}"
  username               = "${module.kubernetes-cluster.username}"
  password               = "${module.kubernetes-cluster.password}"
  client_certificate     = "${base64decode(module.kubernetes-cluster.client_certificate)}"
  client_key             = "${base64decode(module.kubernetes-cluster.client_key)}"
  cluster_ca_certificate = "${base64decode(module.kubernetes-cluster.cluster_ca_certificate)}"
  load_config_file       = false
}

resource "kubernetes_namespace" "build2018" {
  metadata {
    name = "microsoft-build2018"
  }
}

# We can also store secrets in HashiCorp Vault, or anywhere else
resource "kubernetes_secret" "redis-connection-string" {
  metadata {
    name      = "redis-connection-string"
    namespace = "${kubernetes_namespace.build2018.metadata.0.name}"
  }

  data {
    connection-string = "${module.redis-cache.connection_string}"
  }

  type = "kubernetes.io/secret"
}
