# ESPHome 开发版附加组件

这是 **开发** 版本的 ESPHome 附加组件。

要部署生产节点，请使用主流发行版附加组件。

该附加组件使用每天在协调世界时 02:00 自动构建的 ESPHome 版本，用于测试开发中的组件。请查看下面的 `esphome_fork` 配置以正确配置附加组件。一旦更新了配置，请确保重建映像。

## 配置

**注意**：_在更改配置时，记得重启附加组件。_

### 选项：`esphome_fork`

从一个分叉或分支安装 ESPHome。
例如，要测试一个拉取请求，请使用 `pull/XXXX/head`，其中 `XXXX` 是 PR 编号，
或者您可以指定分叉拥有者的用户名和分支 `username:branch`，假设仓库仍名为 `esphome`。

如果您需要在映像更新之前测试开发分支上的最新提交，可以在此输入 `dev`。

请注意，您使用的分叉或分支 **必须** 与 ESPHome 开发版保持最新，
否则附加组件 **将无法启动**。

## 一般 ESPHome 附加组件配置

一般选项在其他版本中也可用。

### 选项：`ssl`

启用或禁用与该附加组件的网络服务器之间的加密 SSL/TLS (HTTPS) 连接。
将其设置为 `true` 以加密通信，设置为 `false` 则不加密。
请注意，如果将此设置为 `true`，您还必须生成加密所需的密钥和证书文件。例如，使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项：`certfile`

用作 SSL 的证书文件。如果此文件不存在，附加组件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项：`keyfile`

用作 SSL 的私钥文件。如果此文件不存在，附加组件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项：`leave_front_door_open`

将此选项添加到附加组件配置中，可通过将其设置为 `true` 来禁用身份验证。

### 选项：`relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以集成到现有的网络代理中，例如在相对 URL 下的 NGINX。默认值为 `/`。

### 选项：`status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。如果路由器不支持 mDNS 转发或 avahi，这在子网之间是无法使用的。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求获取节点状态。如果所有节点始终在离线状态，即使它们已连接，请使用此选项。

### 选项：`streamer_mode`

如果设置为 `true`，将启用流式传输模式，这会使 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSIDs（可能用于查找您的位置）、用户名等。请注意，您需要在 YAML 文件中使用 `!secret` 标签，以防止这些信息在编辑和验证时显示出来。