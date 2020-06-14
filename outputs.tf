# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

//output "admin_public_ip" {
//  description = "public ip address of admin host"
//  value       = module.admin.admin_public_ip
//}
//
output "nexledger_private_ip" {
  description = "private ip address of nexledger host"
  value       = module.admin.private_ip
}

output "ssh_to_admin" {
  description = "convenient output to ssh to the admin host"
  value       = "ssh ubuntu@${module.admin.public_ip}"
}

output "nexledger_admin_portal" {
  description = "access info for nexledger admin portal"
  value       = "${module.admin.public_ip}:9921"
}
/* JJ change on 2020.05.14
output "ocirtoken" {
  description = "authentication token for ocir"
  sensitive   = true
  value       = module.auth.ocirtoken
}
*/

//output "ssh-pkey" {
//  description = "Auto-generated private key !"
//  value       = file("./ssh-keys/id_rsa")
//  depends_on = [null_resource.create_ssh_key]
//}
