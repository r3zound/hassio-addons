
#!/bin/ash


# 获取 JSON 内容并提取数据
hostname=$(hostname)
instance_name=$(jq -r '.easytier.instance_name' /data/options.json)
instance_id=$(jq -r '.easytier.instance_id' /data/options.json)
rpc_portal=$(jq -r '.easytier.rpc_portal' /data/options.json)
network_name=$(jq -r '.easytier.network_name' /data/options.json)
network_secret=$(jq -r '.easytier.network_secret' /data/options.json)
uri=$(jq -r '.easytier.uri' /data/options.json)
cidr=$(jq -r '.easytier.cidr' /data/options.json)

# 创建并写入 TOML 文件
cat <<EOF > /data/config.yaml
hostname = "$hostname"
instance_name = "$instance_name"
instance_id = "$instance_id"
rpc_portal = "$rpc_portal"

[network_identity]
network_name = "$network_name"
network_secret = "$network_secret"

[[peer]]
uri = "$uri"

[[proxy_network]]
cidr = "$cidr"

[flags]

EOF
ls /data -lh
cat /data/config.yaml
echo "Starting EasyTier"
exec easytier-core -c /data/config.yaml
