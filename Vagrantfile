# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
        config.vm.network "private_network", ip: "192.168.33.50"
        config.vm.synced_folder ".","/vagrant", type: "virtualbox", disabled: true
        config.vm.synced_folder ".","/home/vagrant/sync", type: "virtualbox", disabled: true
        config.vm.provider "virtualbox" do |vb|
            vb.memory = 1024
            vb.name = "artifactory"
  end
  config.vm.hostname = "artifactory"
  config.vm.provision "shell",
    inline: "echo '192.168.33.100 learning.puppetlabs.vm' >> /etc/hosts"
  config.vm.provision "shell",
    inline: "curl -k https://learning.puppetlabs.vm:8140/packages/current/install.bash | sudo bash"
end
