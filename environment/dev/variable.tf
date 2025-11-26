variable "rg" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}


variable "re" {
  type = map(object({
    resource_group_name = string
 
  }))
}


variable "vnet" {
  type = map(any)
}
variable "snet" {
}

variable "vm" {
  type = map(any)
}
variable "kv" {
  type = map(any)
}
variable "st" {
  type = map(object({
  stname                     = string
  resource_group_name      =string
  account_tier             = string
  account_replication_type = string

  })
  

  )
}

variable "nic" {

}
variable "bas" {

}
variable "pip" {

}
variable "acr" {

}
variable "aks" {

}
variable "sqldb" {}


variable "sqlserver" {}


