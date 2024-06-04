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

/* Provider configuration with signature-based authentication. */
provider "aci" {
  # cisco-aci user name (local User)
  username = "admin"
  # cisco-aci signature based cert
  #password = "C1sc0TTG"
  password = "C1sc0TTG!"
  #private_key = "tfcert.key"
  #cert_name   = "tfcert.crt"
  # cisco-aci url
  url      = "https://172.31.1.200/"
  insecure = true
}
