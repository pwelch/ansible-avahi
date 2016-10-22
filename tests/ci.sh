#!/bin/bash
set -o errexit

echo "Installing test dependencies..."
sudo apt-get update -qq
sudo apt-get install python-dev python-apt python-pycurl python-pip aptitude python-software-properties software-properties-common --yes
if [ -d "/home/vagrant" ]; then
  sudo apt-add-repository ppa:ansible/ansible --yes
  sudo apt-get update -qq
  sudo apt-get install ansible --yes
else
  pip install ansible==2.1.2.0
fi

pip install ansible-lint

echo "Installing bats testing framework..."
sudo add-apt-repository ppa:duggan/bats --yes
sudo apt-get update -qq
sudo apt-get install bats --yes
