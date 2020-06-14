# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "template_file" "generate_nexledger" {
  template = file("${path.module}/modules/admin/scripts/wait.sh")
  #count = var.oci_admin.admin_enabled == true ? 1 : 0

}

resource "null_resource" "nexledger_wait" {
  connection {
    host     = module.admin.public_ip
    password = "nexledger"
    timeout  = "40m"
    type     = "ssh"
    user     = "ubuntu"
  }

  depends_on = [module.admin]

  provisioner "file" {
    content     = data.template_file.generate_nexledger.rendered
    destination = "~/wait.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x $HOME/wait.sh",
      "bash $HOME/wait.sh",
      "rm -rf $HOME/wait.sh"
    ]
  }

}
