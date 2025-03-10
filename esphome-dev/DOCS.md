# ESPHome 开发版插件

这是 ESPHome 插件的 **开发** 版本。

要部署生产节点，请使用主流发布的插件。

该插件使用每天在 02:00 UTC 自动构建的 ESPHome 版本，用于测试开发中的组件。请查看下面的 `esphome_fork` 配置以正确配置插件。更新配置后，请确保重新构建镜像。

## 配置

**注意**：_在更改配置后，请记得重启插件。_

### 选项：`esphome_fork`

从一个分支或派生版安装 ESPHome。
例如，要测试一个拉取请求，使用 `pull/XXXX/head`，其中 `XXXX` 是 PR 编号，
或者您可以指定派生版所有者的用户名和分支 `username:branch`，
这假设该仓库仍然命名为 `esphome`。

如果需要测试在图像更新之前的开发分支的最新提交，您可以在此输入 `dev`。

请注意，您使用的分支或派生版 **必须** 与 ESPHome 开发版保持最新，
否则插件 **将无法启动**。

## 一般 ESPHome 插件配置

一般选项在其他版本中也可用。

### 选项：`ssl`

启用或禁用与该插件的 Web 服务器的加密 SSL/TLS（HTTPS）连接。
设置为 `true` 以加密通信，设置为 `false` 则为不加密。
请注意，如果将其设置为 `true`，还必须生成用于加密的密钥和证书
文件。例如，可以使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项：`certfile`

用于 SSL 的证书文件。如果该文件不存在，插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认设置。

### 选项：`keyfile`

用于 SSL 的私钥文件。如果该文件不存在，插件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认设置。

### 选项：`leave_front_door_open`

将此选项添加到插件配置中可以通过将其设置为 `true` 来禁用
身份验证。

### 选项：`relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以集成
到现有的 Web 代理（如 NGINX）中。默认为 `/`。

### 选项：`status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。如果您的路由器支持 mDNS 转发或 avahi，
则此功能在不同子网之间无法工作。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求来获取节点状态。如果所有节点在连接时始终显示离线状态，请使用此选项。

### 选项：`streamer_mode`

如果设置为 `true`，将启用流模式，这将使 ESPHome 隐藏所有
潜在的私人信息。例如，WiFi (B)SSID（可以用于查找您的位置）、用户名等。请注意，您需要在 YAML 文件中使用
`!secret` 标签，以防止这些在编辑和验证时显示出来。