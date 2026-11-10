# Orquestación principal de módulos para el servicio de notificaciones
# Superficie de práctica: el estudiante debe ajustar según necesidades

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

module "network" {
  source = "./modules/network"

  environment           = var.environment
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnets_cidr   = var.public_subnets_cidr
  private_subnets_cidr  = var.private_subnets_cidr
}

module "compute" {
  source = "./modules/compute"

  environment            = var.environment
  project_name           = var.project_name
  vpc_id                 = module.network.vpc_id
  subnet_ids             = module.network.private_subnet_ids
  instance_type          = var.instance_type
  ami_id                 = var.ami_id
  key_name               = var.key_name
  security_group_ids     = [module.network.security_group_id]
  min_instance_size      = var.min_instance_size
  desired_instance_size  = var.desired_instance_size
  max_instance_size      = var.max_instance_size
}