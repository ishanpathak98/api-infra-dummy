provider "aws" {
  region = var.aws_region
}

module "networking" {
  source           = "../modules/networking"
  vpc_cidr        = var.vpc_cidr
  subnets         = var.subnets
  security_groups = var.security_groups
}

module "ecs" {
  source          = "../modules/ecs"
  cluster_name    = "staging-cluster"
  subnets         = module.networking.subnet_ids
  security_groups = module.networking.security_group_ids
}

module "monitoring" {
  source          = "../modules/monitoring"
  subnets         = module.networking.subnet_ids
  security_groups = module.networking.security_group_ids
}
