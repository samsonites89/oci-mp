# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#Variables declared in this file must be declared in the marketplace.yaml
#Provide a description to your variables.


# Identity and access parameters
# The following are temporary and must be removed

############################
#  Default Variable Group   #
############################

variable "tenancy_ocid" {
  description = "tenancy id where to create the sources"
  type        = string
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "the oci region where resources will be created"
  type        = string
}

variable "compartment_ocid" {
  description = "Compartment where Compute, Network Marketplace subscription resources will be created"
}

variable "user_ocid" {
  description = "id of user that terraform will use to create the resources"
  type        = string
}

variable "api_fingerprint" {
  description = "fingerprint of oci api private key"
  type        = string
}

variable "api_private_key_path" {
  description = "path for oci api private key"
  type        = string
}



###############################################################################
#  Marketplace Image Listing - information available in the Partner portal    #
###############################################################################

variable "mp_subscription_enabled" {
  description = "Subscribe to Marketplace listing?"
  type        = bool
  default     = true
}

variable "mp_listing_id" {
  default     = "ocid1.appcataloglisting.oc1..aaaaaaaarbw3i2ag3lkalt6wq2ufmhgzktvanwxbqlhzz6m3fph5jx6dhpza"
  description = "Marketplace Listing OCID"
}

variable "mp_listing_resource_id" {
  default     = "ocid1.image.oc1..aaaaaaaaymbzbstp2xvhjdyqlmpbah2w5fpvsgtgi5rts43ypcjqsy635rma"
  description = "Marketplace Listing Image OCID"
}

variable "mp_listing_resource_version" {
  default     = "1.0.0"
  description = "Marketplace Listing Package/Resource Version"
}


#############################
#  Nexledger Configuration  #
#############################

variable "nexledger_engine" {
  description = "Core Engine Deployment. A value among (N,H,E) must be selected. Only one engine can be deployed."
  type        = string

  validation {
    condition     = length(var.nexledger_engine) == 1 && (var.nexledger_engine == "N" || var.nexledger_engine == "H" || var.nexledger_engine == "E")
    error_message = "DEPLOY ENGINE must be either N,H,E ."
  }

}


#############################
#  Compute Configuration  #
#############################

variable "instance_display_name" {
  description = "The name of the VM Instance"
  default     = "nexledger_instance"
  type        = string
}

variable "vm_image_id" {
  description = "image id to use for admin server. set either an image id or to Oracle. if value is set to Oracle, the default Oracle Linux platform image will be used."
  default     = "ocid1.image.oc1.iad.aaaaaaaakqhlxln5vnhsuj6stljp2xnautdpcteaoylven3lkf6rd6mcrckq"
  type        = string
}

variable "vm_shape" {
  description = "shape of Nexledger server instance"
  default     = "VM.Standard.E2.2"
  type        = string
}

variable "vm_timezone" {
  description = "the preferred timezone for the Nexledger host."
  default     = "Asia/Seoul"
  type        = string
}

# availability domains
variable "availability_domains" {
  description = "Availability Domains where to provision resources"
  default = {
    admin = 1
  }
  type = map
}

variable "boot_volume_size_in_gbs" {
  description = "Boot Volume Size for vm instance"
  default     = "50"
  type        = string
}

# ssh keys
variable "ssh_public_key" {
  description = "ssh public key for VM access"
  type        = string
}


#############################
#  Network Configuration  #
#############################


variable "network_strategy" {
  default = "Use Existing VCN and Subnet"
  #default = "Create New VCN and Subnet"
}

variable "vcn_id" {
  default = ""
}

variable "nat_gateway_enabled" {
  description = "whether to create a nat gateway in the vcn."
  default     = true
  type        = bool
}

variable "vcn_cidr" {
  description = "cidr block of VCN"
  default     = "10.0.0.0/16"
  type        = string
}

variable "vcn_dns_label" {
  default = "nex"
  type    = string
}

variable "vcn_name" {
  description = "name of vcn"
  default     = "nex-vcn"
  type        = string
}

variable "subnet_id" {
  default = ""
}
############################
#### Enum Configuration ####
############################

variable "network_strategy_enum" {
  type = map
  default = {
    CREATE_NEW_VCN_SUBNET   = "Create New VCN and Subnet"
    USE_EXISTING_VCN_SUBNET = "Use Existing VCN and Subnet"
  }
}

############################
# Additional Configuration #
############################


# Prefixes for all the resources
variable "label_prefix" {
  description = "a string that will be prepended to all resources"
  default     = "nex"
  type        = string
}

# tagging
variable "tagging" {
  type = object({
    computetag = map(any)
    networktag = map(any)
  })
}
