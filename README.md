## Microsoft Build 2018 Demo

This repository contains one of the demonstrations used in the talk "(BRK2121) Hybrid multi-cloud strategies using Terraform OSS with Azure" which was presented at [Microsoft Build, Seattle](https://www.microsoft.com/en-us/build) in May 2018.

This repository provisions the following:

- [Azure Managed Kubernetes Cluster (AKS)](https://azure.microsoft.com/en-us/services/container-service/) ([Terraform Resource: `azurerm_kubernetes_cluster`](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html))
- [Azure Managed Redis Cache](https://azure.microsoft.com/en-us/services/cache/) ([Terraform Resource: `azurerm_redis_cache`](https://www.terraform.io/docs/providers/azurerm/r/redis_cache.html))
- [Kubernetes Secret](https://kubernetes.io/docs/concepts/configuration/secret/) ([Terraform Resource: `kubernetes_secret`](https://www.terraform.io/docs/providers/kubernetes/r/secret.html))

.. which makes use of the following [Terraform Providers](https://www.terraform.io/docs/providers/index.html):

- [AzureRM](https://www.terraform.io/docs/providers/azurerm/index.html)
  * We use the AzureRM Provider to provision the Azure Managed Kubernetes Cluster and Azure Managed Redis Cache clusters.
- [Kubernetes](https://www.terraform.io/docs/providers/kubernetes/index.html)
  * We use the Kubernetes Provider to store the Redis Connection String as [a Kubernetes Secret](https://www.terraform.io/docs/providers/kubernetes/r/secret.html) such that it can be retrieved by any Pods
- [Template](https://www.terraform.io/docs/providers/template/index.html)
  * This is used to render some connection instructions for demo purposes, it's entirely optional.
- [TLS](https://www.terraform.io/docs/providers/template/index.html)
  * We use the TLS Provider to generate a new SSH Key to be used for the Managed Kubernetes Cluster

This example makes use of [Terraform Modules](https://www.terraform.io/docs/modules/index.html) - with more information available in the README.md for each module:

- [kubernetes-cluster](./modules/kubernetes-cluster)
- [redis-cache](./modules/redis-cache)
- [ssh-key](./modules/ssh-key)
