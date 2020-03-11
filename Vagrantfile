# -*- mode: ruby -*-
# vi: set ft=ruby :

NETWORK_BASE="192.168.11.10"

Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.box_check_update = false

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 1
    end

    config.vm.provision "shell", inline: <<-SHELL
        /vagrant/common.sh
    SHELL

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
  
    (1..2).each do |i|
        config.vm.define "node0#{i}" do |node|
            
            node.vm.network "private_network", ip: "#{NETWORK_BASE}#{i}"
            node.vm.hostname = "node0#{i}.example.com"
        end
    end

    config.vm.define "master", primary: true do |master|
        
        master.vm.network "private_network", ip: "#{NETWORK_BASE}0"
        # master.vm.hostname = "master.example.com"
        master.hostmanager.aliases = %w(master.example.com etcd.example.com nfs.example.com)
        master.vm.provider "virtualbox" do |vb|
            vb.memory = "4096"
            vb.cpus = 2
        end
        
        master.vm.provision "shell", inline: <<-SHELL
            hostnamectl set-hostname master.example.com
            /vagrant/master.sh
        SHELL
        if File.exist?(".vagrant/machines/master/virtualbox/private_key")
            master.vm.provision "master-key", type: "file", source: ".vagrant/machines/master/virtualbox/private_key", destination: "/home/vagrant/.ssh/master.key"
        end
        if File.exist?(".vagrant/machines/node01/virtualbox/private_key")
            master.vm.provision "node01-key", type: "file", source: ".vagrant/machines/node01/virtualbox/private_key", destination: "/home/vagrant/.ssh/node01.key"
        end
        if File.exist?(".vagrant/machines/node02/virtualbox/private_key")
            master.vm.provision "node02-key", type: "file", source: ".vagrant/machines/node02/virtualbox/private_key", destination: "/home/vagrant/.ssh/node02.key"
        end
    end
end
