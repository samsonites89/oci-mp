# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {

  oci_admin_identity = {
    #api_fingerprint      = var.api_fingerprint
    #api_private_key_path = var.api_private_key_path
    #compartment_id       = var.compartment_ocid
    compartment_id = var.compartment_ocid
    tenancy_id     = var.tenancy_ocid
    user_id        = "none"
  }

  oci_admin_general = {
    label_prefix = var.label_prefix
    home_region  = lookup(data.oci_identity_regions.home_region.regions[0], "name")
    region       = var.region
    # disable_auto_retries = var.disable_auto_retries
  }

  oci_base_vcn = {
    compartment_id = var.compartment_ocid
    label_prefix   = var.label_prefix
    tenancy_id     = var.tenancy_ocid
    vcn_cidr       = var.vcn_cidr
    vcn_dns_label  = var.vcn_dns_label
    vcn_name       = var.vcn_name
    boot_volume    = var.boot_volume_size_in_gbs
    # local.use_existing_network referenced in network.tf
    use_existing_network = var.network_strategy == var.network_strategy_enum["USE_EXISTING_VCN_SUBNET"] ? true : false
  }

  oci_admin_network = {
    ad_names             = data.template_file.ad_names.*.rendered
    availability_domains = var.availability_domains["admin"]
    #nat_route_id         = module.vcn.nat_route_id
    nat_route_id = module.vcn.ig_route_id
    vcn_cidr     = var.vcn_cidr
    vcn_id       = var.network_strategy == var.network_strategy_enum["USE_EXISTING_VCN_SUBNET"] ? var.vcn_id : module.vcn.vcn_id
    subnet_id    = var.subnet_id
  }

  oci_admin = {
    admin_image_id = var.mp_subscription_enabled ? var.mp_listing_resource_id : var.vm_image_id
    admin_shape    = var.vm_shape
    ssh_public_key = var.ssh_public_key
    timezone       = var.vm_timezone

    nexledger_opt        = join("", ["NEX=", var.nexledger_engine])
    admin_boot_volume    = var.boot_volume_size_in_gbs
    use_existing_network = var.network_strategy == var.network_strategy_enum["USE_EXISTING_VCN_SUBNET"] ? true : false

  }

  # Marketplace Image listing variables - required for subscription only
  listing_id               = var.mp_listing_id
  listing_resource_id      = var.mp_listing_resource_id
  listing_resource_version = var.mp_listing_resource_version

  # Local to control subscription to Marketplace image.
  mp_subscription_enabled = var.mp_subscription_enabled ? 1 : 0

  tagging = {
    computetag = var.tagging.computetag
    networktag = var.tagging.networktag
  }

}
