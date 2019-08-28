#!/bin/bash

# https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md

apt update;
apt install -y hostapd dnsmasq;

echo \
'interface wlan0
    static ip_address=10.10.0.1/24
    nohook wpa_supplicant' \
> /etc/dhcpcd.conf;

service dhcpcd restart;


mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig;
echo \
'interface=wlan0
  dhcp-range=10.10.0.11,10.10.0.30,255.255.255.0,24h' \
> /etc/dnsmasq.conf;

systemctl reload dnsmasq;

echo \
'interface=wlan0
driver=nl80211
ssid=m4m
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=password
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP' \
> /etc/hostapd/hostapd.conf;

echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd;

echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf;

systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE;
sh -c "iptables-save > /etc/iptables.ipv4.nat"
iptables-restore < /etc/iptables.ipv4.nat;