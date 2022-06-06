#######################################################################
#Example vm creation with static description blocks
Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.define "lab01" do |lab01|
    lab01.vm.box = "hashicorp/bionic64"
    lab01.vm.hostname = "lab01"
    lab01.vm.network "private_network", ip: "192.168.255.101"
    lab01.vm.network :forwarded_port, guest: 5240, host: 5240
    lab01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--memory", "4096"]
      v.customize ["modifyvm", :id, "--name", "lab01"]
    end
  end
end
##############################################################################