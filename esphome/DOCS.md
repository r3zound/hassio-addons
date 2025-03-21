# ESPHome 插件
## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 在 Supervisor 插件商店中搜索“ESPHome”插件。
2. 按下安装以下载插件并在你的机器上解压。这可能需要一些时间。
3. 可选：如果你使用 SSL/TLS 证书并想要加密与这个插件的通信，请在 `ssl` 字段中输入 `true` 并相应地设置 `fullchain` 和 `certfile` 选项。
4. 启动插件，检查插件的日志以查看一切是否正常。
5. 点击“打开网页界面”以打开 ESPHome 仪表板。你将被要求输入 Home Assistant 的凭据 - ESPHome 使用 Home Assistant 的认证系统来登录你。

你可以在 https://esphome.io/ 查看 ESPHome 文档。

## 配置

**注意**：_当配置发生变化时，请记得重启插件。_

插件配置示例：

```json
{
  "ssl": false,
  "certfile": "fullchain.pem",
  "keyfile": "privkey.pem"
}
```

### 选项: `ssl`

启用或禁用与该插件的网络服务器的加密 SSL/TLS (HTTPS) 连接。
将其设置为 `true` 以加密通信，反之则为 `false`。
请注意，如果将其设置为 `true`，你还必须生成加密所需的密钥和证书文件。例如使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/) 或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项: `certfile`

用于 SSL 的证书文件。如果此文件不存在，插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项: `keyfile`

用于 SSL 的私钥文件。如果此文件不存在，插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项: `leave_front_door_open`

在插件配置中添加此选项允许你通过设置为 `true` 来禁用身份验证。

### 选项: `relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便它可以在相对 URL 下集成到现有的 Web 代理，如 NGINX。默认值为 `/`。

### 选项: `status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。除非你的路由器支持 mDNS 转发或 avahi，否则这在子网之间是不工作的。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求来获取节点状态。如果所有节点在连接时总是显示离线状态，请使用此选项。

### 选项: `streamer_mode`

如果设置为 `true`，这将启用流模式，使 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSIDs（可以用来查找你的位置信息）、用户名等。请注意，你需要在 YAML 文件中使用 `!secret` 标签，以便在编辑和验证时也防止这些信息显示出来。