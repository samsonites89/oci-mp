# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

variable "oci_base_vcn" {
  type = object({
    compartment_id          = string
    label_prefix            = string
    vcn_cidr                = string
    vcn_dns_label           = string
    vcn_name                = string
    use_existing_network    = bool
  })
  description = "vcn basic parameters"
}

#tagging
variable "tagging" {
  type = object({
    computetag                = map(any)
    networktag                = map(any)
  }) 
}
