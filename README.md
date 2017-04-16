[![Build Status](https://secure.travis-ci.org/pwelch/ansible-avahi.svg)](http://travis-ci.org/pwelch/ansible-avahi)

# Overview

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/pwelch/ansible-avahi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Ansible Playbook for [avahi](http://avahi.org/) the zeroconf software.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):
```
avahi_hostname: "{{ ansible_hostname }}"
avahi_domain: "local"
avahi_useipv4: "yes"
avahi_useipv6: "no"
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
