#!/bin/bash

# https://www.waveshare.com/wiki/SIM868_PPP_Dail-up_Networking

apt update;
apt install -y ppp;

echo \
'/dev/ttyS0

user "myusername@realm"
connect "/usr/sbin/chat -v -f /etc/chatscripts/gprs"

115200

nocrtscts

debug
nodetach
ipcp-accept-local
ipcp-accept-remote

# Assumes that your IP address is allocated dynamically by the ISP.
noipdefault
# Try to get the name server addresses from the ISP.
usepeerdns
# Use this connection as the default route.
defaultroute

# Makes pppd "dial again" when the connection is lost.
persist

# Do not ask the remote to authenticate.
noauth
' > /etc/ppp/peers/gprs;

echo \
'#!/bin/sh

### BEGIN INIT INFO
# Provides:          m4m-gprs
# Required-Start:    $local_fs $network $syslog
# Required-Stop:     $local_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example
# Description:       Example start-stop-daemon - Debian
### END INIT INFO

pppd call gprs >> /opt/m4m-gprs.log 2>&1 & sleep 10; route add -net 0.0.0.0 ppp0;
' > /etc/init.d/m4m-gprs;
chmod +x /etc/init.d/m4m-gprs;
update-rc.d m4m-gprs defaults;
