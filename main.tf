# # Networking Module
# module "networking" {
#   source = "./modules/networking"

#   vpc_cidr          = var.vpc_cidr
#   subnet_cidr       = var.subnet_cidr
#   private_subnet_cidr = var.private_subnet_cidr
#   availability_zone = var.availability_zone
#   name              = var.name
# }

module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  subnet_cidr         = var.subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  name                = var.name
}

module "ec2" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_name        = module.ssh_key.key_name
  public_subnet_id = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  vpc_id          = module.networking.vpc_id
  name            = var.name
}


# SSH Key Module
module "ssh_key" {
  source = "./modules/ssh_key"

  key_name       = var.key_name
  public_key_path = var.public_key_path
}


