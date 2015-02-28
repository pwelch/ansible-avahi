[![Build Status](https://secure.travis-ci.org/pwelch/ansible-avahi.svg)](http://travis-ci.org/pwelch/ansible-avahi)

# Overview

Ansible Playbook for [avahi](http://avahi.org/) the zeroconf software.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):
```
hostname: "{{ ansible_hostname }}"
domain: "local"
useipv4: "yes"
useipv6: "no"
avahi_install_utils: false
```
## Dependencies

None.

## Example Playbook
```
---
- hosts: all
  roles:
    - avahi
```

## Development
Requires [Vagrant](http://www.vagrantup.com/)

- `vagrant up`

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Source code availabe [here](https://github.com/pwelch/ansible-avahi)
