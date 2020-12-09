
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
  default = "youruser"

}

# cluster name
variable "cluster" {
  type = string
  default = "yourcluster"

}

# datacenter name
variable "datacenter" {
  type = string
  default = "yourdatacenter"

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
  default = "vmname"

}
