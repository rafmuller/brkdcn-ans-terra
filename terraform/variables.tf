variable "tenant_name" {
  default = "ciscolive"
}

variable "vrf_name" {
  default = "ciscolive_vrf"
}

variable "ap_name" {
  default = "ciscolive_ap"
}

// Create separate BDs with for_each
variable "bridge_domains" {
  default = [
    {
      name   = "prod-bd"
      subnet = "10.1.1.1/24"
    },
    {
      name   = "dev-bd"
      subnet = "10.1.2.1/24"
    },
    {
      name   = "test-bd"
      subnet = "10.1.3.1/24"
    }
  ]
}

variable "epgs" {
  default = [
    {
      name               = "prod"
      provided_contracts = ["prod_to_dev"]
      consumed_contracts = []
    },
    {
      name               = "dev"
      subnet             = "10.1.1.1/24"
      provided_contracts = ["dev_to_test"]
      consumed_contracts = ["prod_to_dev"]
    },
    {
      name               = "test"
      subnet             = "10.1.1.1/24"
      provided_contracts = []
      consumed_contracts = ["dev_to_test"]

    }
  ]
}