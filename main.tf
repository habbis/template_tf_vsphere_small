 provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}


data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

# cluster config 

resource "vsphere_compute_cluster" "c1" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

# run on esxi host shell to get crt thumbprint
# openssl x509 -in /etc/vmware/ssl/rui.crt -fingerprint -sha1 -noout

resource "vsphere_host" "h1" {
  hostname = var.esxi_host1
  username = var.esxi_user
  password = var.esxi_password
  thumbprint = var.thumbprint_esxi_host1
  #license  = "00000-00000-00000-00000i-00000"
  cluster  = vsphere_compute_cluster.c1.id
}


resource "vsphere_host" "h2" {
  hostname = var.esxi_host2
  username = var.esxi_user
  password = var.esxi_password
 #license  = "00000-00000-00000-00000i-00000"
  thumbprint = var.thumbprint_esxi_host2
  cluster  = vsphere_compute_cluster.c1.id
}


#resource "vsphere_host" "h3" {
#  hostname = var.esxi_host3
#  username = var.esxi_user
#  password = var.esxi_password
#  thumbprint = var.thumbprint_esxi_host3
#  license  = "00000-00000-00000-00000i-00000"
#  cluster  = vsphere_compute_cluster.c1.id
#}

# dswitch config 


data "vsphere_distributed_virtual_switch" "dvs" {
  name = var.dswitch_vmotion
  datacenter_id = data.vsphere_datacenter.dc.id


  uplinks = ["nic2", "nic3"]
  active_uplinks = ["nic2", "nic3"]
  #standby_uplinks = [ "value" ]

  host {
    host_systemd_id = vsphere_host.h1.id
    devices = [var.network_interfaces_esxi_host1]
  }

  host {
    host_systemd_id = vsphere_host.h2.id
    devices = [var.network_interfaces_esxi_host2]
  }
}

resource "vsphere_distributed_port_group" "pg" {
  name = var.dswitch_vmotion_pg
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.dvs.id

  active_uplinks  = [data.vsphere_distributed_virtual_switch.dvs.uplinks[2][3]]
  #standby_uplinks = [data.vsphere_distributed_virtual_switch.dvs.uplinks[3]]
  }

