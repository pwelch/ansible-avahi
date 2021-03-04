#!/bin/bash
set -o errexit

sudo su -

echo "Installing ansible..."
apt-get update
apt-get install software-properties-common --yes
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install ansible ansible-lint --yes

if [ ! -f /usr/local/bin/bats ]; then
  echo "Installing bats testing framework..."
  pushd /tmp
  git clone https://github.com/sstephenson/bats.git
  cd bats
  ./install.sh /usr/local
  popd
fi
