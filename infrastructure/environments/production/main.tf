provider "aws" {
  region = var.aws_region
}

module "networking" {
  source  = "../modules/networking"
  vpc_id  = var.vpc_id
  subnets = var.subnets
}

module "ecs" {
  source          = "../modules/ecs"
  cluster_name    = var.cluster_name
  vpc_id          = module.networking.vpc_id
  subnets         = module.networking.subnets
  security_groups = var.security_groups
}

module "monitoring" {
  source  = "../modules/monitoring"
  vpc_id  = module.networking.vpc_id
  subnets = module.networking.subnets
}
