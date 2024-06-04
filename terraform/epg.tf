/*
    Creates the Application Profile and configures
    the EPGs -> Web, App, DB. Will be associated to contracts
    in a separate .tf file
*/

resource "aci_application_profile" "terraform_ap" {
  tenant_dn = aci_tenant.terraform_tenant.id
  name      = var.ap_name
}

resource "aci_application_epg" "epg" {
  for_each               = { for epg in var.epgs : epg.name => epg }
  application_profile_dn = aci_application_profile.terraform_ap.id
  name                   = each.key
  relation_fv_rs_bd      = aci_bridge_domain.bridge_domain["${each.value.name}-bd"].id
  relation_fv_rs_prov    = [for con in each.value.provided_contracts : "uni/tn-${var.tenant_name}/brc-${con}"]
  relation_fv_rs_cons    = [for con in each.value.consumed_contracts : "uni/tn-${var.tenant_name}/brc-${con}"]
}