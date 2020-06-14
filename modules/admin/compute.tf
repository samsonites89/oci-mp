# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "oci_core_instance" "admin" {
  availability_domain = element(var.oci_admin_network.ad_names, (var.oci_admin_network.availability_domains - 1))
  compartment_id      = var.oci_admin_identity.compartment_id
  freeform_tags       = var.tagging.computetag
  
  create_vnic_details {
    assign_public_ip = true
    //subnet_id        = oci_core_subnet.admin.id
    subnet_id        = local.use_existing_network ? var.oci_admin_network.subnet_id : oci_core_subnet.admin[0].id
    display_name     = "${var.oci_admin_general.label_prefix}-admin-vnic"
    hostname_label   = "admin"
  }

  display_name = "${var.oci_admin_general.label_prefix}-admin"

  # prevent the bastion from destroying and recreating itself if the image ocid changes 
  lifecycle {
    ignore_changes = [source_details[0].source_id]
  }

  metadata = {
    #ssh_authorized_keys = file(var.oci_admin.ssh_public_key_path)
    ssh_authorized_keys = var.oci_admin.ssh_public_key
    #ssh_authorized_keys = file("${path.root}/ssh-keys/id_rsa.pub")
    #ssh_authorized_keys = var.oci_admin.generate_ssh_keys == true ? file("${path.root}/ssh-keys/id_rsa.pub") : var.oci_admin.ssh_public_key
    user_data           = data.template_cloudinit_config.admin.rendered
  }

  shape = var.oci_admin.admin_shape

  source_details {
    source_type = "image"
    source_id   = local.admin_image_id
    #source_id   = "ocid1.image.oc1.ap-seoul-1.aaaaaaaajsolmhhy7xjgfscxb4vpyet6k2sop6wdtwmn3dkc3fy7eyt3m24a"
    boot_volume_size_in_gbs = local.admin_boot_volume
  }

  timeouts {
    create = "60m"
  }

  #depends_on = [ oci_identity_policy.admin_instance_principal ]
}
