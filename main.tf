module "vpc" {
  source       = "./modules/vpc"
  region       = var.aws_region
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  azs          = var.azs
}