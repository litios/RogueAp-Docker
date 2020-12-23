FROM ubuntu:18.04

RUN apt update && apt install hostapd dnsmasq bridge-utils iptables -qy

COPY ./dnsmasq.conf /etc/dnsmasq.conf
COPY ./hostapd-wpa2.conf /etc/hostapd/hostapd-wpa2.conf
COPY ./hostapd-nosec.conf /etc/hostapd/hostapd-nosec.conf
COPY ./entrypoint.sh /entrypoint.sh

RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

ENTRYPOINT [ "/entrypoint.sh" ]