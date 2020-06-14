# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "nexledger_private_ip" {
  description = "private ip address of nexledger host"
  value       = module.admin.private_ip
}

output "ssh_to_admin" {
  description = "convenient output to ssh to the admin host"
  value       = "ssh ubuntu@${module.admin.public_ip}"
}


