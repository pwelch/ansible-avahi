# -*- mode: ruby -*-
# vi: set ft=ruby :

MEMORY = ENV['VAGRANT_MEMORY'] || '1024'
CORES  = ENV['VAGRANT_CORES']  || '2'

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", MEMORY.to_i]
    vb.customize ["modifyvm", :id, "--cpus", CORES.to_i]
  end

  config.vm.box     = "precise64_vmware"
  config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.vm.synced_folder ".", "/home/vagrant/ansible-avahi"

  # Update apt-get
  config.vm.provision :shell, :inline => "apt-get update"

  # Install Ansible
  config.vm.provision :shell, :inline => <<-EOF
  apt-get install -qq python-dev python-apt python-pycurl python-pip && \
  pip install ansible==1.8.0
  EOF

  # Setup and run tests
  config.vm.provision :shell, :inline => <<-EOF
  cd /home/vagrant/ansible-avahi && \
  mkdir test
  ansible-playbook --syntax-check --inventory-file=tests/inventory test.yml
  ansible-playbook --inventory-file=tests/inventory tests/test.yml --connection=local --sudo
  EOF
end
