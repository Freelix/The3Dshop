# -*- mode: ruby -*-
# vi: set ft=ruby :

# Variables 
API_VERSION = 2

Vagrant.configure(API_VERSION) do |config|
  
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = 'rails-3dshop'
  config.vm.synced_folder 'syncedFiles', '/home/vagrant/syncedFiles'

  # Forward the Rails server default port to the host
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

end
