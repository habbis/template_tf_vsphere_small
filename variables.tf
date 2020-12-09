
# vcenter sever
variable "vsphere_server" {
  type = string
  default = ""

}

# vcenter user
variable "vsphere_user" {
  type = string
  default = "youruser"
}

# vcenter password
variable "vsphere_password" {
  type = string
  default = "yourpassword"

}

# esxi user
variable "esxi_user" {
  type = string
  default = "root"
}


# esxi host 1
variable "esxi_host1" {
  type = string
  default = "yourhost"
}

# esxi password
variable "esxi_password" {
  type = string
  default = "youruser"

}

# esxi host 1
variable "esxi_host1" {
  type = string
  default = "yourhost"
}

# esxi network interface
variable "network_interfaces_esxi_host1" {
  default = [
    "vmnic2",
    "vmnic3",
  ]
}

# ssl cert esxi host 1
variable "thumbprint_esxi_host1"
  type = string 
  default = "fignerprint"

# esxi host 2
variable "esxi_host2" {
  type = string
  default = "yourhost"
}

# ssl cert esxi host 2
variable "thumbprint_esxi_host2"
  type = string
  default = "fignerprint"



# esxi network interface 
variable "network_interfaces_esxi_host2" {
  default = [
    "vmnic2",
    "vmnic3",
  ]
}

# cluster name
variable "cluster" {
  type = string
  default = "cluster01"

}

# pool
variable "pool1" {
  type = string
  default = "pool01"
}

# datacenter name
variable "datacenter" {
  type = string
  default = "datacenter"

}

# dswitch 
variable "dswitch_vmotion" {
  type = string
  default = "Dmotion"
  
}

variable "dswitch_vmotion_pg" {
  type = string
  default = "Dmotion_pg"

}

# datastore name
variable "datastore" {
  type = string
  default = "vmstore01"

}

# network adapter
variable "network" {
  type = string
  default = "test"

}

# hostname and vmname
variable "vmname" {
  type = string 
  default = "yourvmname"

}
