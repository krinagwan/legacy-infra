

module "mrg" {
  source = "../module/resourcegroup"
  rg     = var.rg
tags  =local.common_tags

}


module "mrg1" {
  source = "../module/resourcegroup copy"
  re    = var.re
tags  =local.common_tags

location  =local.common_location
}


# module "mkv" {
#   source = "../module/kv"
#   kv=var.kv
# }
# module "mvnet" {
#   depends_on = [module.mrg]
#   source     = "../module/vnet"
#   vnet       = var.vnet
# }
# module "msubnet" {
#   depends_on = [module.mvnet,module.mpip]
#   source = "../module/subnet"
#   snet=var.snet
# }

# module "mvm" {
#   depends_on = [module.msubnet, module.mvnet,module.mnic,module.mbas]
#   source     = "../module/compute"
#   vm         = var.vm
# }
# module "mnic" {
#   depends_on = [module.msubnet ]
# source = "../module/nic"
# nic=var.nic

# }
module "mst" {
  source = "../module/storage"
  st=var.st
  tags = local.common_tags
}

# module "mbas" {
#   depends_on = [module.mrg, module.mvnet,module.msubnet]
#   source     = "../module/bastion"
#   bas        = var.bas
# }

# module "mpip" {
#   depends_on = [module.mrg, module.mvnet]
#   source     = "../module/pip"
#   pip        = var.pip
# }

# module "macr" {
#   depends_on = [module.mrg]
#   source     = "../module/acr"
#   acr        = var.acr
# }

# module "maks" {
#   depends_on = [module.mrg]
#   source     = "../module/aks"
#   aks        = var.aks
# }

# module "msqlserver" {
#   depends_on = [module.mrg]
#   source     = "../module/sqlserver"
#   sqlserver        = var.sqlserver
# }
# module "msqldb" {
#   depends_on = [module.mrg,module.msqlserver]
#   source     = "../module/sqldb"
#   sqldb        = var.sqldb
# }
