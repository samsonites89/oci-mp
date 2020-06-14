# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

terraform {
  required_version = ">= 0.12.16"
  experiments      = [variable_validation]
}

module "vcn" {
  source       = "./modules/vcn"
  oci_base_vcn = local.oci_base_vcn
  tagging      = local.tagging
}

module "admin" {
  source             = "./modules/admin"
  oci_admin_identity = local.oci_admin_identity
  oci_admin_general  = local.oci_admin_general
  oci_admin_network  = local.oci_admin_network
  oci_admin          = local.oci_admin
  #oci_admin_notification = local.oci_admin_notification
  tagging = local.tagging
}

# module policies
# module auth

