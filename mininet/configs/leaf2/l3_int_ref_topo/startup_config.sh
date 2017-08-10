#!/bin/bash

stty -echo; set +m

ip link set dev leaf2-eth1 address 00:02:00:00:00:01
ip link set dev leaf2-eth2 address 00:02:00:00:00:02
ip link set dev leaf2-eth3 address 00:02:00:00:00:03
ip link set dev leaf2-eth4 address 00:02:00:00:00:04

ip address add 10.0.3.100/24 broadcast + dev leaf2-eth1
ip address add 10.0.4.100/24 broadcast + dev leaf2-eth2
ip address add 10.1.21.1/24 broadcast + dev leaf2-eth3
ip address add 10.1.22.1/24 broadcast + dev leaf2-eth4

cp /configs/quagga/* /etc/quagga/
chown quagga.quagga /etc/quagga/*
