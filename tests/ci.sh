#!/bin/bash
set -o errexit

echo "Installing test dependencies..."
sudo apt-get update -qq
sudo apt-get install python-apt python-pycurl aptitude python-software-properties --yes

echo "Installing bats testing framework..."
sudo add-apt-repository ppa:duggan/bats --yes
sudo apt-get update -qq
sudo apt-get install bats --yes
