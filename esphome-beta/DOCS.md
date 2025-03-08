# ESPHome 附加组件
## 安装

此附加组件的安装相当简单，与安装其他 Home Assistant 附加组件并无不同。

1. 在 Supervisor 附加组件商店中搜索 “ESPHome” 附加组件。
2. 按下安装按钮以下载此附加组件并在您的机器上解压。这可能需要一些时间。
3. 可选：如果您使用 SSL/TLS 证书并希望加密与此附加组件的通信，请在 `ssl` 字段中输入 `true`，并相应地设置 `fullchain` 和 `certfile` 选项。
4. 启动附加组件，检查附加组件的日志以查看一切是否正常。
5. 点击 "OPEN WEB UI" 打开 ESPHome 控制面板。您将被要求输入您的 Home Assistant 凭据 - ESPHome 使用 Home Assistant 的认证系统进行登录。

您可以在 https://esphome.io/ 查看 ESPHome 文档。

## 配置

**注意**： _在更改配置时，请记得重启附加组件。_

附加组件配置示例：

```json
{
  "ssl": false,
  "certfile": "fullchain.pem",
  "keyfile": "privkey.pem"
}
```

### 选项： `ssl`

启用或禁用对该附加组件的 Web 服务器的加密 SSL/TLS（HTTPS）连接。
设置为 `true` 以加密通信，设置为 `false` 否则。
请注意，如果将此设置为 `true`，您还必须生成用于加密的密钥和证书文件。例如使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/) 或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项： `certfile`

用于 SSL 的证书文件。如果该文件不存在，将导致附加组件启动失败。

**注意**：文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项： `keyfile`

用于 SSL 的私钥文件。如果该文件不存在，将导致附加组件启动失败。

**注意**：文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项： `leave_front_door_open`

将此选项添加到附加组件配置中可以通过将其设置为 `true` 来禁用身份验证。

### 选项： `relative_url`

在相对 URL 下托管 ESPHome 控制面板，以便可以集成到现有的 Web 代理（如 NGINX）的相对 URL 下。默认为 `/`。

### 选项： `status_use_ping`

默认情况下，控制面板使用 mDNS 检查节点是否在线。此功能在子网间无法工作，除非您的路由器支持 mDNS 转发或 Avahi。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求获取节点状态。如果所有节点在连接时始终显示离线状态，请使用此选项。

### 选项： `streamer_mode`

如果设置为 `true`，将启用流模式，这会使 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSID（可用于查找您的位置）、用户名等。请注意，您需要在 YAML 文件中使用 `!secret` 标签，以防止这些在编辑和验证时显示。