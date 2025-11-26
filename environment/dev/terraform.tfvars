rg = {
  rg1 = {
    resource_group_name = "dev-rg-0001"
    location            = "West europe"
    # tags = {
    #   environment = "staging"
    # }
  }


}

re={
 rg2 = {
    resource_group_name = "dev-rg-0002"
    # location            = "West europe"
    # tags = {
    #   environment = "staging"
    # }
  }
}



vnet = {
  vnet1 = {
    vnetname                      = "dev-network"
    address_space                 = ["10.0.0.0/16"]
    location                      = "West europe"
    resource_group_name           = "dev-rg-0001"
    subnetname                    = "dev-subnet-internal"
    address_prefixes              = ["10.0.2.0/24"]
    nicname                       = "example-nic"
    ipconfigname                  = "internal"
    private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "staging"
    }
  }
}

snet = {
  snet1 = {
    vnetname                      = "dev-network"
    location                      = "West europe"
    resource_group_name           = "dev-rg-0001"
    subnetname                    = "dev-subnet-internal"
    pipname                       = "dev-pip-ooo1"
    address_prefixes              = ["10.0.2.0/24"]
    nicname                       = "example-nic"
    ipconfigname                  = "internal"
    private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "staging"
    }
    create_nic = true # REQUIRED
  }

  snet2 = {
    vnetname                      = "dev-network"
    location                      = "West europe"
    resource_group_name           = "dev-rg-0001"
    subnetname                    = "AzureBastionSubnet"
    address_prefixes              = ["10.0.3.0/26"]
    pipname                       = "baspip"
    ipconfigname                  = "internal"
    private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "staging"
    }
    create_nic = false # Do NOT create NIC here
  }


  # snet3 = {
  #   vnetname                      = "dev-network"
  #   location                      = "West europe"
  #   resource_group_name           = "dev-rg-0001"
  #   pipname                       = "dev-pip-ooo1"
  #   subnetname                    = "akssubnet"
  #   address_prefixes              = ["10.0.4.0/24"]
  #   nicname                       = "example-nic3"
  #   ipconfigname                  = "internal"
  #   private_ip_address_allocation = "Dynamic"
  #   tags = {
  #     environment = "staging"
  #   }
  #   create_nic = true 
  # }

}

nic = {
  nic1 = {
    vnetname                      = "dev-network"
    location                      = "West europe"
    resource_group_name           = "dev-rg-0001"
   subnetname                    = "dev-subnet-internal"
    pipname                       = "dev-pip-ooo1"
    nicname                       = "example-nic"
    ipconfigname                  = "internal"
    private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "staging"
    }
    create_nic = true # REQUIRED
  }

  # nic3 = {
  #   vnetname                      = "dev-network"
  #   location                      = "West europe"
  #   resource_group_name           = "dev-rg-0001"
  #   subnetname                    = "AzureBastionSubnet"
  #   pipname                       = "baspip"
  #   nicname                       = "example-nic3"
  #   ipconfigname                  = "internal"
  #   private_ip_address_allocation = "Dynamic"
  #   tags = {
  #     environment = "staging"
  #   }
  #   create_nic = true # REQUIRED
  # }

}


vm = {
  vm1 = {
    vmname               = "example-machine"
    location             = "West europe"
    resource_group_name  = "dev-rg-0001"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    pipname              = "dev-pip-ooo1"
    offer                = "0001-com-ubuntu-server-jammy"
    script_name          = "nginx.sh"
    sku                  = "22_04-lts"
    version              = "latest"
    kvname               = "deveastnagkeyvault"
    nicname                       = "example-nic3"
    nsgname              = "devnsgeast"
    inboundname          = "inbound443"
    adminusername        = "adminusername"
    adminpassword        = "adminpassword"
    tags = {
      environment = "staging"
    }
  }
}


kv = {
  kv1 = {
    kvname                      = "deveastnagkeyvault"
    location                    = "West europe"
    resource_group_name         = "dev-rg-0001"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    adminusername               = "adminusername"
    adminpassword               = "adminpassword"
    adminusernamevalue          = "vm1234"
    adminpasswordvalue          = "Rjil@12345678"
    tags = {
      environment = "staging"
    }
  }
}


st = {
  st1 = {
    stname                   = "storageeastdev01"
    location                 = "West europe"
    resource_group_name      = "dev-rg-0001"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
      environment = "staging"
    }
  }
}

bas = {
  bas1 = {

    pipname             = "baspip"
    location            = "West europe"
    resource_group_name = "dev-rg-0001"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "staging"
    }
    basipconfigname = "bastion-ip"
    subnetname      = "AzureBastionSubnet"
    basname         = "devbaseast"
    vnetname        = "dev-network"
  }
}


pip = {
  # pip1 = {
  #   pipname             = "dev-pip-ooo1"
  #   location            = "West europe"
  #   resource_group_name = "dev-rg-0001"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"
  #   tags = {
  #     environment = "staging"
  #   }
  # }
  pip2 = {
    pipname             = "baspip"
    location            = "West europe"
    resource_group_name = "dev-rg-0001"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "staging"
    }
  }
}

acr = {
  acr1 = {
    acrname             = "acrdev0001"
    location            = "West europe"
    resource_group_name = "dev-rg-0001"
    sku                 = "Standard"
    admin_enabled       = false
    tags = {
      environment = "staging"
    }

  }

}


aks = {
  aks1 = {
    aksname                           = "aksdev"
    aksidentityname                   = "identity-dev"
    location                          = "West europe"
    resource_group_name               = "dev-rg-0001"
    vnetname                          = "dev-network"
    subnetname                        = "akssubnet"
    dns_prefix                        = "dev-dnsprefix"
    kubernetes_version                = 1.31
    type                              = "UserAssigned"
    poolname                          = "agentpool"
    node_count                        = 2
    vm_size                           = "Standard_DS2_v2"
    network_plugin                    = "azure"
    load_balancer_sku                 = "standard"
    role_based_access_control_enabled = true
    tags = {
      environment = "staging"
    }

  }
}


sqlserver = {
  sql1 = {
    servername          = "mdevlesqlserver"
    resource_group_name = "dev-rg-0001"
    vnetname            = "dev-network"
    location            = "West europe"
    kvname              = "deveastnagkeyvault"
    version             = "12.0"
    tags = {
      environment = "staging"
    }
  }
}



sqldb = {
  db1 = {
    dbname              = "myexamplesqldatabase"
    resource_group_name = "dev-rg-0001"
    vnetname            = "dev-network"
    location            = "West europe"
    stname              = "storageeastdev01"
    servername          = "mdevlesqlserver"
    sku_name            = "S0"

    max_size_gb    = 10
    zone_redundant = false
    tags = {
      environment = "staging"
    }
  }
}
