module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.1.0"

  cluster_name    = var.eks_cluster_name[terraform.workspace]
  cluster_version = var.eks_cluster_version
  vpc_id          = aws_vpc.demo.id
  subnets         = aws_subnet.demo[*].id

  worker_groups = [
    {
      instance_type = var.eks_worker_group_instance_type
      asg_max_size  = var.eks_worker_group_asg_max_size
    }
  ]
}