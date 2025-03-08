# SSH 隧道

Hass.io 插件，用于通过 SSH 协议在外部服务器上设置对 **Home Assistant** 的外部访问。如果您有“灰色” IP 地址，这很有用。

您需要事先租用一个具有 SSH 访问权限的服务器。

默认情况下，该插件会将 Hass.io 服务器的 80 和 443 端口转发到外部服务器。并在 Hass.io 服务器上创建 SOCKS 代理。

在首次设置时，只需配置您的服务器的 `host`、`port` 和 `user`。

启动时，日志中将显示公共 SSH 密钥（相当长），例如：

```
ssh-rsa AAAAB3NzaC1yc2EA...XfsAODObXZRVMI03 root@2fc7ce79c3de
```

密钥在每次安装插件时都是随机生成的。您需要将其 **复制到您的公共服务器** 的用户主目录中，该用户是您通过 SSH 连接到服务器的用户：

`~/.ssh/authorized_keys`

例如 `/root/.ssh/authorized_keys` 或 `/home/USERNAME/.ssh/authorized_keys`

如有必要，请创建 `.ssh` 目录和 `authorized_keys` 文件—它们可能不存在。

**注意！** `.ssh` 目录被视为隐藏目录。

断开连接后，连接将自动恢复。但请阅读 **断线恢复** 部分。

## 设置

- `ssh_host` - 公共服务器的地址
- `ssh_user` - 公共服务器的用户
- `ssh_port` - 公共服务器的端口
- `tunnel_http` - 转发 HTTP 端口
- `tunnel_https` - 转发 HTTPS 端口
- `socks_port` - 在指定的 Hass.io 服务器端口上启用 SOCKS 代理模式
- `advanced` - SSH 命令的附加参数
- `before` - 见 **断线恢复** 部分

**注意！** 要转发“特权”端口（例如 80 和 443），公共服务器的用户必须是管理员。如果您对此有问题，可以搜索：**ssh forward privileged ports**。

配置示例：

- 将 80 和 443 端口从 Hass.io 服务器转发到外部服务器
- 在 Hass.io 服务器上创建端口 1080 的 SOCKS 代理

```yaml
ssh_host: 87.250.250.242
ssh_user: root
ssh_port: 22
tunnel_http: true
tunnel_https: true
socks_port: 1080
```

## 应用

### 访问 Home Assistant 的外部访问

与 [Caddy Proxy](https://github.com/bestlibre/hassio-addons/tree/master/caddy_proxy) 插件搭配使用非常方便。这是一个轻量级的 Web 服务器，自动生成 HTTPS 证书。

Caddy Proxy 的配置示例：

```yaml
homeassistant: sshtunnel.duckdns.org
vhosts: []
raw_config: []
email: sshtunnel@gmail.com
```

电子邮件用于生成证书。域名 (DNS) 需要指向您公共服务器的 IP 地址。

**设置：**

1. 租用 VDS 服务器
2. 设置 SSH 隧道插件
3. 创建并配置 Duck DNS 账户
4. 设置 Caddy Proxy 插件
5. 配置 Home Assistant 的双因素认证
6. 享受安全和稳定的 HA 外部访问

### Telegram 机器人的代理

```yaml
telegram_bot:
- platform: broadcast
  api_key: TELEGRAM_BOT_API_KEY
  allowed_chat_ids: [123456789]
  proxy_url: socks5://172.17.0.1:1080
```

PS：`172.17.0.1` - 对于标准的 hass.io 安装，此 IP 地址无需更改

### 局部资源的隧道

例如通过路由器对家庭 OpenVPN 服务器的外部访问。

```yaml
advanced: -R 1194:192.168.1.1:1194
```

PS：现在您可以通过 `sshtunnel.duckdns.org:1194` 连接到自己家中

### 断线恢复

插件设置了每 30 秒检查一次连接。在 3 次检查失败后，连接将断开。

**注意！** 在默认设置下，断开连接后，您服务器上的端口将保持占用状态！

有两种解决方案：

1. 在服务器上设置与客户端的连接检查：[ClientAliveInterval](https://sys-adm.in/os/nix/429-centos-increase-ssh-session-timeout.html)

2. 在每次客户端连接开始时释放端口

为此，我创建了选项 `before: fuser -k 443/tcp`。**fuser** 是释放 Ubuntu 中占用的端口的方法之一，**默认未安装！**

我个人使用第二种解决方案。