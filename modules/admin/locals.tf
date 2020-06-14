# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# Protocols are specified as protocol numbers.
# https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml

locals {
  all_protocols = "all"
  anywhere      = "0.0.0.0/0"
  ssh_port      = 22
  tcp_protocol  = 6
  es_port       = "9200"
  admin_port    = "9921"
  #admin_image_id = var.oci_admin.admin_image_id == "Oracle" ? data.oci_core_images.admin_images.images.0.id : var.oci_admin.admin_image_id
  #admin_image_id = data.oci_core_images.admin_images.images.0.id
  admin_image_id = var.oci_admin.admin_image_id
  admin_boot_volume = var.oci_admin.admin_boot_volume
  use_existing_network = var.oci_admin.use_existing_network

}
