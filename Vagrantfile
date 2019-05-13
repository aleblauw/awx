# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'geerlingguy/centos7'
  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '4096'
  end
#  config.vm.provision 'shell', inline: 'yum update -y'
  {
    'awx'   => '192.168.33.11',
    'lab'   => '192.168.33.12'
  }.each do |short_name, ip|
    config.vm.define short_name do |host|
      host.vm.network 'private_network', ip: ip
      host.vm.hostname = "#{short_name}.dev"
    end
  end
  config.vm.define "windows" do |windows|
  config.vm.box = "gusztavvargadr/windows-server"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |win|
     win.gui = true
     win.memory = "1024"
   end
  config.vm.boot_timeout = 1800 
  config.vm.guest = "windows"
  config.vm.communicator = 'winrm'
  config.winrm.timeout = 1800
  end
end
