variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region for AWS resources."
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"] // Put it manually instead of auto picking active ones due to availability issues of the instance types
}

variable "eks_cluster_name" {
  type = map(any)
  default = {
    dev  = "dev",
    prod = "prod",
    test = "test"
  }
  description = "Name of the EKS cluster."
}

variable "eks_cluster_version" {
  type        = string
  default     = "1.20"
  description = "Kubernetes version to use for the EKS cluster."
}

variable "eks_worker_group_instance_type" {
  type        = string
  default     = "t2.medium"
  description = "Node group's instance type."
}

variable "eks_worker_group_asg_max_size" {
  type        = number
  default     = 3
  description = "Max number of workers"
}

variable "k8s_namespace" {
  type        = string
  default     = "default"
  description = "Namespace for deployments and services in K8s"
}