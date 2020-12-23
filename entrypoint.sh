#!/bin/bash

if [[ "$SECURE" == "wpa2" ]]; 
then
    mv /etc/hostapd/hostapd-wpa2.conf /etc/hostapd/hostapd.conf
    echo "wpa_passphrase=$PASSPHRASE" >> /etc/hostapd/hostapd.conf  
else
    mv /etc/hostapd/hostapd-nosec.conf /etc/hostapd/hostapd.conf
fi  

echo "interface=$AP_INTERFACE" >> /etc/hostapd/hostapd.conf
echo "interface=$AP_INTERFACE" >> /etc/dnsmasq.conf
echo "ssid=$SSID" >> /etc/hostapd/hostapd.conf
echo 'DAEMON_CONF="-dd -t -f /hostapd.log /etc/hostapd/hostapd.conf"' >> /etc/default/hostapd

service dnsmasq start
service hostapd start

iptables -t nat -A POSTROUTING -o $INT_INTERFACE -j MASQUERADE

tail -f /hostapd.log