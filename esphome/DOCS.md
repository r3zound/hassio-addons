# ESPHome 插件
## 安装

安装此插件非常简单，与安装其他 Home Assistant 插件没有区别。

1. 在 Supervisor 插件商店中搜索“ESPHome”插件。
2. 按下安装以下载插件并在您的机器上解压。这可能需要一些时间。
3. 可选：如果您使用 SSL/TLS 证书并希望加密与此插件的通信，请在 `ssl` 字段中输入 `true`，并相应地设置 `fullchain` 和 `certfile` 选项。
4. 启动插件，检查插件的日志以查看一切是否正常。
5. 点击“打开网页界面”以打开 ESPHome 仪表板。您将被要求输入您的 Home Assistant 凭据 - ESPHome 使用 Home Assistant 的身份验证系统进行登录。

您可以在 https://esphome.io/ 查看 ESPHome 文档。

## 配置

**注意**：_记得在更改配置时重启插件。_

Example add-on configuration:

```json
{
  "ssl": false,
  "certfile": "fullchain.pem",
  "keyfile": "privkey.pem"
}
```

### Option: `ssl`

Enables or disables encrypted SSL/TLS (HTTPS) connections to the web server of this add-on.
Set it to `true` to encrypt communications, `false` otherwise.
Please note that if you set this to `true` you must also generate the key and certificate
files for encryption. For example using [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
or [Self-signed certificates](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/).

### Option: `certfile`

The certificate file to use for SSL. If this file doesn't exist, the add-on start will fail.

**Note**: The file MUST be stored in `/ssl/`, which is the default for Home Assistant

### Option: `keyfile`

The private key file to use for SSL. If this file doesn't exist, the add-on start will fail.

**Note**: The file MUST be stored in `/ssl/`, which is the default for Home Assistant

### Option: `leave_front_door_open`

Adding this option to the add-on configuration allows you to disable
authentication by setting it to `true`.

### Option: `relative_url`

Host the ESPHome dashboard under a relative URL, so that it can be integrated
into existing web proxies like NGINX under a relative URL. Defaults to `/`.

### Option: `status_use_ping`

By default the dashboard uses mDNS to check if nodes are online. This does
not work across subnets unless your router supports mDNS forwarding or avahi.

Setting this to `true` will make ESPHome use ICMP ping requests to get the node status. Use this if all nodes always have offline status even when they're connected.

### Option: `streamer_mode`

If set to `true`, this will enable streamer mode, which makes ESPHome hide all
potentially private information. So for example WiFi (B)SSIDs (which could be
used to find your location), usernames, etc. Please note that you need to use
the `!secret` tag in your YAML file to also prevent these from showing up
while editing and validating.
