#!/bin/ash
opkg update
mkdir -p /data/overlay
mount --bind /data/overylay /
/sbin/init


