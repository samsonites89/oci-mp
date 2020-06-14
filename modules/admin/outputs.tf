# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "private_ip" {
  value = data.oci_core_instance.admin.private_ip
}

output "public_ip" {
  value = data.oci_core_instance.admin.public_ip
}
