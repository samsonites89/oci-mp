# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

resource "oci_core_vcn" "vcn" {
  count          = local.use_existing_network ? 0 : 1

  cidr_block     = var.oci_base_vcn.vcn_cidr
  compartment_id = var.oci_base_vcn.compartment_id
  display_name   = var.oci_base_vcn.vcn_name
  dns_label      = var.oci_base_vcn.vcn_dns_label
  freeform_tags  = var.tagging.networktag
}

resource "oci_core_internet_gateway" "ig" {
  count          = local.use_existing_network ? 0 : 1

  compartment_id = var.oci_base_vcn.compartment_id
  display_name   = "${var.oci_base_vcn.label_prefix}-ig-gw"
  vcn_id         = oci_core_vcn.vcn[count.index].id
}

resource "oci_core_route_table" "ig_route" {
  count          = local.use_existing_network ? 0 : 1

  compartment_id = var.oci_base_vcn.compartment_id
  display_name   = "${var.oci_base_vcn.label_prefix}-ig-route"

  route_rules {
    destination       = local.anywhere
    network_entity_id = oci_core_internet_gateway.ig[count.index].id
  }

  vcn_id = oci_core_vcn.vcn[count.index].id
}
