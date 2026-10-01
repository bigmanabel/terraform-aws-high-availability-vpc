module "vpc" {
  source             = "./modules/vpc"
  region             = var.aws_region
  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  azs                = var.azs
  nat_gateway_per_az = var.nat_gateway_per_az
}
