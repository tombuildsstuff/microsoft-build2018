variable "prefix" {
  description = "The Prefix used for resources in this example"
}

variable "location" {
  default     = "Central US"
  description = "The Azure Region in which the resources should be created"
}

variable "tags" {
  type = "map"

  default = {
    "Environment" = "Production"
  }
}

variable "kubernetes_client_id" {
  description = "The Client ID of a Service Principal which can be used by the Managed Kubernetes Cluster to interact with Azure"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret of a Service Principal which can be used by the Managed Kubernetes Cluster to interact with Azure"
}
