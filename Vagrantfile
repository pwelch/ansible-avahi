# -*- mode: ruby -*-
# vi: set ft=ruby :

MEMORY = ENV['VAGRANT_MEMORY'] || '1024'
CORES  = ENV['VAGRANT_CORES']  || '2'

Vagrant.configure('2') do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', MEMORY.to_i]
    vb.customize ['modifyvm', :id, '--cpus', CORES.to_i]
  end

  config.vm.box = 'ubuntu/focal64'

  config.vm.network :private_network, ip: '192.168.99.133'

  config.vm.synced_folder '.', '/home/vagrant/ansible-avahi'

  # Update apt-get
  config.vm.provision :shell, inline: 'apt-get update'

  # Install Ansible
  config.vm.provision :shell, path: 'tests/ci.sh'

  # Setup and run tests
  config.vm.provision :shell, inline: <<-SHELL
  cd /home/vagrant/ansible-avahi && \
  ansible-lint . &&
  printf '[defaults]\nroles_path=../' >ansible.cfg &&
  ansible-playbook --syntax-check --inventory-file=tests/inventory tests/test.yml &&
  ansible-playbook --inventory-file=tests/inventory tests/test.yml --connection=local &&
  sleep 3 &&
  bats tests/tests.bats
  SHELL
end
