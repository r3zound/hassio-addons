#!/bin/ash

instance_name=$(jq -r '.instance_name // "easytier"' /data/options.json)
hostname=$(hostname)
instance_id=$(jq -r '.instance_id // "b96927a0-7ec1-4a7c-8487-e9bc6eaa176e"' /data/options.json)
ipv4=$(jq -r '.ipv4 // "1.1.1.1/24"' /data/options.json)
dhcp=$(jq -r '.dhcp // false' /data/options.json)
listeners=$(jq -r '.listeners // ["tcp://0.0.0.0:11010", "udp://0.0.0.0:11010", "wg://0.0.0.0:11011"]' /data/options.json)
rpc_portal=$(jq -r '.rpc_portal // "0.0.0.0:0"' /data/options.json)
network_name=$(jq -r '.network_name // "easytier"' /data/options.json)
network_secret=$(jq -r '.network_secret // "easytier"' /data/options.json)
peer_uri=$(jq -r '.peer_uri // "tcp://public.easytier.top:11010"' /data/options.json)
cidr=$(jq -r '.cidr // "10.10.1.0/24"' /data/options.json)
disable_kcp_input=$(jq -r '.disable_kcp_input // true' /data/options.json)
disable_p2p=$(jq -r '.disable_p2p // true' /data/options.json)
enable_encryption=$(jq -r '.enable_encryption // false' /data/options.json)
enable_exit_node=$(jq -r '.enable_exit_node // true' /data/options.json)
enable_kcp_proxy=$(jq -r '.enable_kcp_proxy // true' /data/options.json)
latency_first=$(jq -r '.latency_first // true' /data/options.json)
no_tun=$(jq -r '.no_tun // true' /data/options.json)
proxy_forward_by_system=$(jq -r '.proxy_forward_by_system // true' /data/options.json)
relay_all_peer_rpc=$(jq -r '.relay_all_peer_rpc // true' /data/options.json)
use_smoltcp=$(jq -r '.use_smoltcp // true' /data/options.json)
config_server=$(jq -r '.config_server // "username"' /data/options.json)

args=""
[ -n "$hostname" ] && args="$args --hostname $hostname"
[ -n "$instance_name" ] && args="$args --instance-name $instance_name"
[ -n "$instance_id" ] && args="$args --instance-id $instance_id"
[ -n "$ipv4" ] && args="$args --ipv4 $ipv4"
[ -n "$dhcp" ] && args="$args --dhcp $dhcp"
[ -n "$listeners" ] && args="$args --listeners $listeners"
[ -n "$rpc_portal" ] && args="$args --rpc-portal $rpc_portal"
[ -n "$network_name" ] && args="$args --network-name $network_name"
[ -n "$network_secret" ] && args="$args --network-secret $network_secret"
[ -n "$peer_uri" ] && args="$args --peer-uri $peer_uri"
[ -n "$cidr" ] && args="$args --cidr $cidr"
[ -n "$disable_kcp_input" ] && args="$args --disable-kcp-input $disable_kcp_input"
[ -n "$disable_p2p" ] && args="$args --disable-p2p $disable_p2p"
[ -n "$enable_encryption" ] && args="$args --enable-encryption $enable_encryption"
[ -n "$enable_exit_node" ] && args="$args --enable-exit-node $enable_exit_node"
[ -n "$enable_kcp_proxy" ] && args="$args --enable-kcp-proxy $enable_kcp_proxy"
[ -n "$latency_first" ] && args="$args --latency-first $latency_first"
[ -n "$no_tun" ] && args="$args --no-tun $no_tun"
[ -n "$proxy_forward_by_system" ] && args="$args --proxy-forward-by-system $proxy_forward_by_system"
[ -n "$relay_all_peer_rpc" ] && args="$args --relay-all-peer-rpc $relay_all_peer_rpc"
[ -n "$use_smoltcp" ] && args="$args --use-smoltcp $use_smoltcp"

# Run easytier-core command with arguments
if [ "$config_server" != "username" ]; then
    easytier-core -w "$config_server"
else
    easytier-core $args
fi