# ESPHome 开发附加组件

这是 ESPHome 附加组件的 **开发** 版本。

要部署生产节点，请使用主流发布的附加组件。

该附加组件使用每天下午 02:00 UTC 自动构建的 ESPHome 版本，用于测试开发中的组件。请查看下面的 `esphome_fork` 配置，以正确配置附加组件。更新配置后，请确保重建映像。

## 配置

**注意**：_在更改配置时，请记得重启附加组件。_

### 选项：`esphome_fork`

从一个分支或叉中安装 ESPHome。
例如，要测试一个拉取请求，请使用 `pull/XXXX/head`，其中 `XXXX` 是 PR 编号，
或者您可以指定分叉拥有者的用户名和分支 `username:branch`，这
假定仓库仍然名为 `esphome`。

如果您需要在映像更新之前测试开发分支上的最新提交，可以在这里输入 `dev`。

请注意，您使用的分支或叉 **必须** 与 ESPHome 开发版同步
否则附加组件 **将无法启动**。

## 一般 ESPHome 附加组件配置

通用选项也适用于其他版本。

### 选项：`ssl`

启用或禁用与该附加组件的 Web 服务器的加密 SSL/TLS（HTTPS）连接。
将其设置为 `true` 以加密通信，设置为 `false` 则禁用加密。
请注意，如果您将此设置为 `true`，则还必须为加密生成密钥和证书文件。
例如使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/) 
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项：`certfile`

用于 SSL 的证书文件。如果此文件不存在，附加组件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认目录。

### 选项：`keyfile`

用于 SSL 的私钥文件。如果此文件不存在，附加组件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认目录。

### 选项：`leave_front_door_open`

将此选项添加到附加组件配置中，可以通过将其设置为 `true` 来禁用身份验证。

### 选项：`relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以集成到现有的 Web 代理中，例如 NGINX，使用相对 URL。默认值为 `/`。

### 选项：`status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。这在子网之间不起作用，除非您的路由器支持 mDNS 转发或 avahi。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求来获取节点状态。即使所有节点在线，也请使用此选项，如果它们显示为离线状态。

### 选项：`streamer_mode`

如果设置为 `true`，则将启用流模式，这会使 ESPHome 隐藏所有潜在的私人信息。例如 WiFi (B)SSIDs（可能用于查找您的位置）、用户名等。请注意，您需要在 YAML 文件中使用 `!secret` 标签，以防止在编辑和验证时显示这些信息。