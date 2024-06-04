/* 
    Configures the Bridge Domain and Bridge domain subnets.
*/

resource "aci_bridge_domain" "bridge_domain" {
  for_each           = { for bd in var.bridge_domains : bd.name => bd }
  tenant_dn          = aci_tenant.terraform_tenant.id
  relation_fv_rs_ctx = aci_vrf.terraform_vrf.id
  name               = each.value.name
}

resource "aci_subnet" "bridge_domain_subnet" {
  for_each  = { for bd in var.bridge_domains : bd.name => bd }
  parent_dn = aci_bridge_domain.bridge_domain[each.value.name].id
  ip        = each.value.subnet
}
