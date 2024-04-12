#!/bin/sh
ip a add 10.204.25.178/24 dev $1
ip link set $1 up
