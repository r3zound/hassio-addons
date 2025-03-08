# ESPHome 插件
## 安装

该插件的安装非常简单，与安装其他 Home Assistant 插件没有区别。

1. 在 Supervisor 插件商店中搜索 “ESPHome” 插件。
2. 点击安装以下载插件并在你的机器上解压。这可能需要一些时间。
3. 可选：如果你使用 SSL/TLS 证书并希望加密与该插件的通信，请在 `ssl` 字段中输入 `true`，并相应地设置 `fullchain` 和 `certfile` 选项。
4. 启动插件，查看插件的日志以确认一切顺利。
5. 点击“打开 WEB 界面”以打开 ESPHome 控制面板。系统将要求你输入 Home Assistant 的凭据 - ESPHome 使用 Home Assistant 的认证系统让你登录。

你可以在 https://esphome.io/ 查看 ESPHome 文档。

## 配置

**注意**：_记得在配置更改后重启插件。_

示例插件配置：

```json
{
  "ssl": false,
  "certfile": "fullchain.pem",
  "keyfile": "privkey.pem"
}
```

### 选项: `ssl`

启用或禁用到该插件的 Web 服务器的加密 SSL/TLS (HTTPS) 连接。
设置为 `true` 将加密通信，设置为 `false` 则不加密。
请注意，如果将其设置为 `true`，你还必须生成密钥和证书文件以进行加密。例如，可以使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/) 或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项: `certfile`

用于 SSL 的证书文件。如果此文件不存在，则插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项: `keyfile`

用于 SSL 的私钥文件。如果此文件不存在，则插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项: `leave_front_door_open`

在插件配置中添加此选项允许你通过将其设置为 `true` 来禁用认证。

### 选项: `relative_url`

在相对 URL 下托管 ESPHome 控制面板，以便可以集成到现有的 Web 代理中，例如 NGINX。默认为 `/`。

### 选项: `status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。如果你的路由器不支持 mDNS 转发或 avahi，这在子网之间将无法工作。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求以获取节点状态。如果所有节点即使在连接时也始终显示离线状态，请使用此设置。

### 选项: `streamer_mode`

如果设置为 `true`，这将启用流模式，使 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSID（可能用于定位）、用户名等。请注意，你需要在 YAML 文件中使用 `!secret` 标签，以防止这些信息在编辑和验证时显示。