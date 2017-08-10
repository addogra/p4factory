#!/bin/bash

stty -echo; set +m

ip link set dev spine2-eth1 address 00:04:00:00:00:01
ip link set dev spine2-eth2 address 00:04:00:00:00:02

ip address add 10.1.12.2/24 broadcast + dev spine2-eth1
ip address add 10.1.22.2/24 broadcast + dev spine2-eth2 

cp /configs/quagga/* /etc/quagga/
chown quagga.quagga /etc/quagga/*
