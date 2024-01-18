locals {
  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id
  account_id     = data.terraform_remote_state.vpc.outputs.account_id
  worker_subnets = data.terraform_remote_state.vpc.outputs.worker_subnets
  pod_subnets    = data.terraform_remote_state.vpc.outputs.pod_subnets
  public_subnets = data.terraform_remote_state.vpc.outputs.public_subnets
  cluster_name   = data.terraform_remote_state.vpc.outputs.eks_cluster_name
  region         = data.terraform_remote_state.vpc.outputs.region

}