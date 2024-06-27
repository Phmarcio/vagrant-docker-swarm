# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  
  # Configuração da máquina node-master
  config.vm.define "node-master" do |node_master|
    node_master.vm.hostname = "node-master"
    node_master.vm.network "public_network", type: "dhcp"
    node_master.vm.provider "vmware_workstation" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    node_master.vm.provision "shell", path: "node-master.sh"
  end
  
  # Configuração das máquinas workers
  (1..2).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.hostname = "node-#{i}"
      node.vm.network "public_network", type: "dhcp"
      node.vm.provider "vmware_workstation" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      node.vm.provision "shell", path: "node-worker.sh"
    end
  end
end