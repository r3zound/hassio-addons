# ESPHome 开发版插件

这是 ESPHome 插件的 **开发** 版本。

要部署生产节点，请使用主流发布的插件。

该插件使用的 ESPHome 版本是每天在 UTC 时间 02:00 自动构建的，用于测试开发中的组件。请参考下面的 `esphome_fork` 配置以正确配置插件。一旦您更新了配置，请确保重新构建镜像。

## 配置

**注意**：_请记得在更改配置时重启插件。_

### 选项：`esphome_fork`

从一个分支或分支安装 ESPHome。
例如要测试一个拉取请求，使用 `pull/XXXX/head`，其中 `XXXX` 是 PR 编号，
或者您可以指定分支拥有者的用户名和分支 `username:branch` ，前提是
该存储库仍然名为 `esphome`。

如果您需要在镜像更新之前测试开发分支上的最新提交，可以在这里输入 `dev`。

请注意，您使用的分支或分支 **必须** 与 ESPHome 开发版保持最新，
否则插件 **将无法启动**。

## 一般 ESPHome 插件配置

一般选项在其他版本中也可用。

### 选项：`ssl`

启用或禁用与此插件的 Web 服务器的加密 SSL/TLS (HTTPS) 连接。
设置为 `true` 以加密通信，`false` 则不加密。
请注意，如果将其设置为 `true`，您还必须生成加密的密钥和证书文件。
例如使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项：`certfile`

用于 SSL 的证书文件。如果该文件不存在，则插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项：`keyfile`

用于 SSL 的私钥文件。如果该文件不存在，则插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项：`leave_front_door_open`

在插件配置中添加此选项允许您通过将其设置为 `true` 来禁用身份验证。

### 选项：`relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以集成到现有的 Web 代理中，例如在相对 URL 下的 NGINX。默认值为 `/`。

### 选项：`status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。这在子网间不起作用，除非您的路由器支持 mDNS 转发或 avahi。

将其设置为 `true` 将使 ESPHome 使用 ICMP ping 请求来获取节点状态。如果所有节点在连接时总是显示离线状态，请使用此选项。

### 选项：`streamer_mode`

如果设置为 `true`，这将启用流媒体模式，这使 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSID（可能被用于查找您的位置）、用户名等。请注意，您需要在 YAML 文件中使用 `!secret` 标签，以防止这些信息在编辑和验证时显示。