# ESPHome 插件
## 安装

这个插件的安装相当简单，与安装任何其他 Home Assistant 插件没有区别。

1. 在 Supervisor 插件商店中搜索“ESPHome”插件。
2. 点击安装以下载插件并在你的机器上解压。这可能需要一些时间。
3. 可选：如果你正在使用 SSL/TLS 证书并希望加密与此插件的通信，请在 `ssl` 字段中输入 `true`，并相应地设置 `fullchain` 和 `certfile` 选项。
4. 启动插件，检查插件的日志以查看是否一切顺利。
5. 点击“打开网页界面”以打开 ESPHome 仪表板。系统会要求你输入 Home Assistant 的凭据 - ESPHome 使用 Home Assistant 的认证系统来登录。

你可以在 https://esphome.io/ 查看 ESPHome 的文档。

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

启用或禁用到此插件的网页服务器的加密 SSL/TLS (HTTPS) 连接。
设置为 `true` 以加密通信，设置为 `false` 否则。
请注意，如果将其设置为 `true`，则必须生成用于加密的密钥和证书
文件。例如使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项: `certfile`

用于 SSL 的证书文件。如果此文件不存在，插件启动将失败。

**注意**：此文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项: `keyfile`

用于 SSL 的私钥文件。如果此文件不存在，插件启动将失败。

**注意**：此文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项: `leave_front_door_open`

在插件配置中添加此选项可以通过设置为 `true` 来禁用身份验证。

### 选项: `relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以集成到现有的网络代理中，例如在相对 URL 下的 NGINX。默认值为 `/`。

### 选项: `status_use_ping`

默认情况下，仪表板使用 mDNS 来检查节点是否在线。除非你的路由器支持 mDNS 转发或 avahi，否则这在子网之间无法工作。

将其设置为 `true` 将使 ESPHome 使用 ICMP ping 请求来获取节点状态。如果所有节点即使在连接时总是显示离线状态，请使用此选项。

### 选项: `streamer_mode`

如果设置为 `true`，则将启用流媒体模式，这使得 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSID（可能用于找到你的定位）、用户名等。请注意，你需要在 YAML 文件中使用 `!secret` 标签，以防止这些信息在编辑和验证时显示出来。