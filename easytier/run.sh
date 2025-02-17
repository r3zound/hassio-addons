#!/bin/ash

instance_name=$(jq -r '.instance_name // "easytier"' /data/options.json)
hostname=$(jq -r '.hostname' /data/options.json)
ipv4=$(jq -r '.ipv4' /data/options.json)
dhcp=$(jq -r '.dhcp' /data/options.json)
network_name=$(jq -r '.network_name' /data/options.json)
network_secret=$(jq -r '.network_secret' /data/options.json)
proxy_networks=$(jq -r '.proxy-networks' /data/options.json)
default_protocol=$(jq -r '.default_protocol' /data/options.json)
dev_name=$(jq -r '.dev_name' /data/options.json)
disable_ipv6=$(jq -r '.disable-ipv6' /data/options.json)
mtu=$(jq -r '.mtu' /data/options.json)
latency_first=$(jq -r '.latency_first' /data/options.json)
enable_exit_node=$(jq -r '.enable_exit_node' /data/options.json)
no_tun=$(jq -r '.no_tun' /data/options.json)
use_smoltcp=$(jq -r '.use_smoltcp' /data/options.json)
config_server=$(jq -r '.config-server' /data/options.json)


args=()


[ -n "$instance_name" ] && args+=("--instance-name" "$instance_name")
[ -n "$hostname" ] && args+=("--hostname" "$hostname")
[ -n "$ipv4" ] && args+=("--ipv4" "$ipv4")
[ -n "$dhcp" ] && args+=("--dhcp" "$dhcp")
[ -n "$network_name" ] && args+=("--network-name" "$network_name")
[ -n "$network_secret" ] && args+=("--network-secret" "$network_secret")
[ -n "$proxy_networks" ] && args+=("--proxy-networks" "$proxy_networks")
[ -n "$default_protocol" ] && args+=("--default-protocol" "$default_protocol")
[ -n "$dev_name" ] && args+=("--dev-name" "$dev_name")
[ -n "$disable_ipv6" ] && args+=("--disable-ipv6" "$disable_ipv6")
[ -n "$mtu" ] && args+=("--mtu" "$mtu")
[ -n "$latency_first" ] && args+=("--latency-first" "$latency_first")
[ -n "$enable_exit_node" ] && args+=("--enable-exit-node" "$enable_exit_node")
[ -n "$no_tun" ] && args+=("--no-tun" "$no_tun")
[ -n "$use_smoltcp" ] && args+=("--use-smoltcp" "$use_smoltcp")

# 运行 easytier-core 命令并传递参数
#if [ "$config_server" != "username" ]; then
#    easytier-core -w "$config_server"
#else
#    easytier-core "${args[@]}"
#fi
#easytier-core -w $config_server

while true; do
    echo "hello world"
    sleep 5
done
