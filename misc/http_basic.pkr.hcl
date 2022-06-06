source "qemu" "example" {
  iso_url           = "https://releases.ubuntu.com/focal/ubuntu-20.04.4-live-server-amd64.iso"
  iso_checksum      = "28ccdb56450e643bad03bb7bcf7507ce3d8d90e8bf09e38f6bd9ac298a98eaad"
  output_directory  = "output_centos_tdhtest"
  shutdown_command  = "sudo shutdown -P now"
  disk_size         = "10000M"
  cpus              = 2
  memory            = 2048
  format            = "qcow2"
  accelerator       = "kvm"
  http_directory    = "http"
  ssh_username      = "ubuntu"
  ssh_password      = "ubuntu"
  ssh_timeout       = "20m"
  vm_name           = "tdhtest"
  net_device        = "e1000"
  disk_interface    = "virtio"
  boot_wait         = "2s"
  boot_command      = [
    "<enter><enter><f6><esc><wait> ",
    "autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
    ]
}

build {
  sources = ["source.qemu.example"]

  provisioner "shell" {
    inline = [
      "sudo rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg",
      "sudo cloud-init clean",
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
      "sudo systemctl enable apache2"
    ]
  }
}