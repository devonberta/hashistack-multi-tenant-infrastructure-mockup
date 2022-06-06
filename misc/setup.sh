#! /bin/bash

# move to /tmp for working on script
cd /tmp

#setup for podman
source /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -

# setup nomad
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# update packages after setting up repos
apt-get update
apt-get -y upgrade

apt-get -y install podman
apt-get -y install qemu-kvm libvirt-daemon-system libvirt-clients virtinst cpu-checker libguestfs-tools libosinfo-bin
apt-get -y install nomad

# enable and start podman
systemctl enable podman.service
systemctl start podman.service

# setup podman task driver
mkdir -p /opt/nomad/data/plugins
curl https://releases.hashicorp.com/nomad-driver-podman/0.3.0/nomad-driver-podman_0.3.0_linux_amd64.zip --output nomad-driver-podman.zip
unzip nomad-driver-podman.zip
mv nomad-driver-podman /opt/nomad/data/plugins/nomad-driver-podman
cp /home/grays/Documents/repos/nomad-lab/99-nomad.hcl /etc/nomad.d/99-nomad.hcl

# enable and start nomad
systemctl enable nomad.service
systemctl start nomad.service

# install packer
apt-get install packer


#### Note for consul to bind to dns port 53
setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/consul

# Consul setup to test connecting a vm with consul connect to another vm or docker container. Bonus validate it works with windows server also which will provide a method to allow operating systems that do not support consul connect to be deployed as vms on linux hosts as hypervisors and be tracked in the same service mesh and leverage the same controls. Sucks windows does not properly support connect and envoy proxy but this enables the same access without the guest os being aware. Windows can still run a consul agent for service discovery of what to connect too which hopefully will be sufficient for workloads. We will see how it plays out. Otherwise will have to use bridged networking and perform service discovery that way but lose service mesh security features of connect in the process. Not ideal. 


qemu image overlayfs command:
qemu-img create -b /home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/testvmimage.qcow2 -f qcow2 /home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/vm1.qcow2

# tool to create cloud init media:
sudo apt-get install -y cloud-image-utils

# command to create cloud init media:
cloud-localds -v --network-config=network_config_static.cfg test1-seed.img cloud_init.cfg
cloud-localds my-seed.img my-user-data
qemu -net nic -net user -hda cloud-image.img -hdb my-seed.img -m 512

