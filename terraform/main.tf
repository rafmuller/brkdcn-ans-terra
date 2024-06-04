/* 
   This configures the required provider plugins for ACI as well 
   as the ACI provider. We are specifying the exact version of the ACI 
   plugin that we want installed but you can remove this to install the latest
   one. 
   All the other configurations are in separated .tf files.
*/

terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "2.11.1"
    }
  }
}

/* Provider configuration with Username/password authentication. */
provider "aci" {
  # cisco-aci user name (local User)
  username = "admin"
  password = "cisco123!"
  # cisco-aci url
  url      = "https://172.31.1.200/"
  insecure = true
}
