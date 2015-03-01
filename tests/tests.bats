#!/usr/bin/env bats

@test "avahi-daemon package installed" {
  dpkg --list | grep --word-regexp "avahi-daemon"
}

@test "avahi-daemon configuration file exists" {
  test -e /etc/avahi/avahi-daemon.conf
}

@test "avahi-daemon service should be running" {
  [ "$(ps aux | grep --word-regexp 'avahi-daemon: running' | grep --invert-match grep)" ]
}
