provider "libvirt" {
    uri = "qemu:///system"
}
resource "libvirt_domain" "terraform_test" {
  name = "terraform_test"
  network_interface = {
    mac = "52:54:00:36:c0:65"
  }
    #provisioner "remote-exec" {
    #    inline = "uname -a"
    #}
  disk {
     volume_id = "${libvirt_volume.ubuntu_base.id}"
    #volume_id = "/var/lib/libvirt/images/ubuntu.img"
  }
}
resource "libvirt_volume" "ubuntu_base" {
  name = "ubuntu_base"
    source = "http://cloud-images.ubuntu.com/releases/15.10/release/ubuntu-15.10-server-cloudimg-amd64-disk1.img"
}
#resource "libvirt_volume" "ubuntu" {
#  name = "ubuntu"
#  base_volume_id = "${libvirt_volume.ubuntu_base.id}"
#}
