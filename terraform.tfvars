

# Oracle Cloud Infrastructure Authentication details
tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa7up5ypdg3hikgm2cehtlwhissyqqn3jljirqpkkrqeomiepgrfwa"

# Compartment
compartment_ocid = "ocid1.tenancy.oc1..aaaaaaaa7up5ypdg3hikgm2cehtlwhissyqqn3jljirqpkkrqeomiepgrfwa"

# samsonites info for testing purposes
user_ocid            = "ocid1.user.oc1..aaaaaaaa3ywupog6ktuhnj4n5n2atubwgzzae727lqgvleed67yp4ybqz3ba"
api_fingerprint      = "1f:2b:54:81:74:5c:ae:9c:b0:0f:d0:e5:03:f6:36:e0"
api_private_key_path = "~/.oci/oci_api_key.pem"
ssh_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx2p8Gzda+nU9LrTgEqaNRr/ajzRBWoRMLQoeJg9XRCrcuJtog79MOejOz6MS9qCznMJRXAg7Q98ds5T4c/KqOLpgKyQkH7sH6KWKecJ5/Nx1cZyFxlonrqvA9aeo9lxHVxKaKF34C2okiX8h826s7EBxn+YCNJAnFJTtCn8NBX1RgS7IOwHbLtesQx5DfnWGz73V2m/2QabcCMClw2if50PbMVyXLIs2UFN4qXHLOXOySnjx+Shaq5hdIoeCOG2n8ZLRX0pTXeP83JfKhabdhzBjZ8LqfgOQzx/a8H2DdZuT4lFVQt41B9fpweomo+WJiVWLbIvzC/Nyvg9b5HTjb samuel.son@deliver.markets"

# Region
region = "us-ashburn-1"

# Compute Instance Configurations
instance_display_name   = "nexledger_instance"
boot_volume_size_in_gbs = "50"

#Nexledger configuration
nexledger_engine = "E"
subnet_id = "ocid1.subnet.oc1.iad.aaaaaaaacuu76nil44jjfsrbitibzjfmbgicde53nuikdqxuqajjbw46uhiq"
vcn_id    = "ocid1.vcn.oc1.iad.amaaaaaaxmh2i5aawrvrxu6vj2myionhbqhe2r3ml5p3q6thqqtqz6dyv77a"

# tagging
tagging = {
  computetag = { "Environment" = "Nexledger-v2.2" }
  networktag = { "Name" = "Nexledger-v2.2" }
}
