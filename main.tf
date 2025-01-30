module "network" {
  source                  = "./modules/network"
}

module "ec2" {
  source                  = "./modules/ec2"
  public_subnet_1_id      = module.network.public_subnet_1_id
  ansys_security_group_id = module.network.ansys_security_group_id

  depends_on = [
    module.network
  ]
}
