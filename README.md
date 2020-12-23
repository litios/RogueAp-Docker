# RogueAp-Docker
A docker container to perform rogue AP attacks

# Description

The container has:

* Hostapd
* Iptables
* Bridge-utils
* Dnsmasq

# Instructions

To create the image just:

`docker build -t RogueAp .`

To create an AP without authentication:

`docker run --net host --privileged -e AP_INTERFACE=wlan1 -e INT_INTERFACE=wlan0 -e SSID=MySSID RogueAp`

To create it with WPA2 auth:

`docker run -it --net host --privileged -e AP_INTERFACE=wlan1 -e INT_INTERFACE=wlan0 -e SSID=McDonalds -e SECURE=wpa2 -e PASSPHRASE=testtest RogueAp`

Environment variables:

* AP_INTERFACE: the interface which is going to be used for the AP
* INT_INTERFACE: the interface with Internet connection
* SSID: the SSID (name) of the AP
* SECURE (optional): the authorization mecanism
* PASSPHRASE (optional): the passphrase in case an authorization mecanism was specified.

*At the moment, it only has WPA2*

# Docker Hub

The image is available at:

https://hub.docker.com/repository/docker/litios/rogueap