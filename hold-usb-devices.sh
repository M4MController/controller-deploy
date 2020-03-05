#!/bin/bash
#
# https://unix.stackexchange.com/a/183492

echo \
'SUBSYSTEM=="tty", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", SYMLINK+="obd"
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="xbee"
SUBSYSTEM=="tty", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0001", SYMLINK+="xbee"
' > /etc/udev/rules.d/99-usb-serial.rules;

udevadm trigger;
