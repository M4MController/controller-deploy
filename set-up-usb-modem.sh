#!/bin/bash

# https://raspberrypi.stackexchange.com/a/81459

apt update;
apt install -y wvdial;

echo \
'
[Dialer Defaults]
Init1 = ATZ
Init2 = ATQ0 V1 E1 S0=0
Modem Type = Analog Modem
Baud = 9600
New PPPD = yes
Modem = /dev/ttyUSB1
ISDN = 0
Phone = *99#
Password = internet
Username = internet
' > /etc/wvdial.conf;

echo \
'[Unit]
Description=Internet

[Service]
ExecStart=/usr/bin/wvdial
User=root
Group=root

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/wvdial.service;

systemctl daemon-reload
systemctl enable wvdial
systemctl start wvdial
