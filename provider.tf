locals {
  dir = replace(basename(path.cwd), "_", "-")
}
terraform {
  backend "s3" {
    bucket         = "pritam-tf-state-backend"
    key            = "eks-iam/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
    encrypt        = true
    session_name   = "terraform"
    profile        = "terraform"
    role_arn       = "arn:aws:iam::635066407893:role/tf-master"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }
}

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  shared_config_files      = ["~/.aws/config"]
  profile                  = "terraform"

  region = "us-east-1"
  # assume_role {
  #   role_arn = "arn:aws:iam::635066407893:role/tf-master"
  # }
  default_tags {
    tags = {
      Environment = "Test"
      Name        = "EKS"
    }
  }
}

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.eks.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.eks.token
# } 
