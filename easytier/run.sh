#!/bin/sh
set -e

instance_name=$(jq -r '.instance_name // "easytier"' /data/options.json)
hostname=$(jq -r '.hostname' /data/options.json)
ipv4=$(jq -r '.ipv4' /data/options.json)
dhcp=$(jq -r '.dhcp' /data/options.json)
network_name=$(jq -r '.network_name' /data/options.json)
network_secret=$(jq -r '.network_secret' /data/options.json)
client_cidr=$(jq -r '.client_cidr' /data/options.json)
default_protocol=$(jq -r '.default_protocol' /data/options.json)
dev_name=$(jq -r '.dev_name' /data/options.json)
enable_encryption=$(jq -r '.enable_encryption' /data/options.json)
enable_ipv6=$(jq -r '.enable_ipv6' /data/options.json)
mtu=$(jq -r '.mtu' /data/options.json)
latency_first=$(jq -r '.latency_first' /data/options.json)
enable_exit_node=$(jq -r '.enable_exit_node' /data/options.json)
no_tun=$(jq -r '.no_tun' /data/options.json)
use_smoltcp=$(jq -r '.use_smoltcp' /data/options.json)
foreign_network_whitelist=$(jq -r '.foreign_network_whitelist' /data/options.json)
config-server=$(jq -r '.config-server' /data/options.json)

if [ "$config_server" != "username" ]; then
    easytier-core -w ${config-server}
else
    easytier-core --instance-name ${instance_name} --hostname ${hostname} --ipv4 ${ipv4} --dhcp ${dhcp} --network-name ${network_name} --network-secret ${network_secret} --client-cidr ${client_cidr} --default-protocol ${default_protocol} --dev-name ${dev_name} --enable-encryption ${enable_encryption} --enable-ipv6 ${enable_ipv6} --mtu ${mtu} --latency-first ${latency_first} --enable-exit-node ${enable_exit_node} --no-tun ${no_tun} --use-smoltcp ${use_smoltcp} --foreign-network-whitelist ${foreign_network_whitelist}
fi


