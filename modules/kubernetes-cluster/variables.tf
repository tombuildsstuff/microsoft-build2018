variable "prefix" {
  description = "The prefix used for naming resources used in within the Managed Kubernetes Cluster"
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Managed Kubernetes Cluster"
}

variable "location" {
  description = "The Azure Region in which to create the Managed Kubernetes Cluster"
}

variable "tags" {
  default     = {}
  description = "Any tags that should be present on the Managed Kubernetes Cluster resources"
  type        = "map"
}

variable "admin_username" {
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "admin_public_ssh_key" {
  description = "The SSH Key associated with the local administrator on the Kubernetes Cluster"
}

variable "agents_count" {
  default     = 3
  description = "The number of Agents that should exist in the Agent Pool"
}

variable "agents_ostype" {
  default     = "Linux"
  description = "The Operating System used on the Agents in the Agent Pool. Either `Linux` or `Windows`."
}

variable "agents_size" {
  description = "The Azure VM Size of the Virtual Machines used in the Agent Pool"
}

variable "service_principal_client_id" {
  description = "The Client ID of the Service Principal assigned to Kubernetes"
}

variable "service_principal_client_secret" {
  description = "The Client Secret of the Service Principal assigned to Kubernetes"
}
