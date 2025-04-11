# ESPHome DEV 附加组件

这是 ESPHome 附加组件的 **开发** 版本。

要部署生产节点，请使用主流发布的附加组件。

该附加组件使用每天 UTC 02:00 自动构建的 ESPHome 版本，用于测试开发中的组件。请查看下面的 `esphome_fork` 配置，以正确配置附加组件。一旦您更新了配置，请确保重新构建镜像。

## 配置

**注意**：_记得在更改配置后重启附加组件。_

### 选项：`esphome_fork`

从一个分支或分叉安装 ESPHome。
例如，要测试一个拉取请求，请使用 `pull/XXXX/head`，其中 `XXXX` 是 PR 编号，
或者您可以指定分叉所有者的用户名和分支 `username:branch`，这
假设代码库仍然命名为 `esphome`。

如果您需要在图像更新之前测试开发分支的最新提交，您可以在这里输入 `dev`。

请注意，您正在使用的分叉或分支 **必须** 与 ESPHome 开发版保持最新，
否则附加组件 **将无法启动**。

## 一般 ESPHome 附加组件配置

一般选项在其他版本中也适用。

### 选项：`ssl`

启用或禁用与此附加组件的网页服务器的加密 SSL/TLS (HTTPS) 连接。
将其设置为 `true` 以加密通信，否则设置为 `false`。
请注意，如果将其设置为 `true`，还必须生成加密的密钥和证书
文件。例如，使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项：`certfile`

用于 SSL 的证书文件。如果此文件不存在，附加组件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项：`keyfile`

用于 SSL 的私钥文件。如果此文件不存在，附加组件启动将失败。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项：`leave_front_door_open`

在附加组件配置中添加此选项可以通过将其设置为 `true` 来禁用
身份验证。

### 选项：`relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以集成到现有的网络代理中，如 NGINX，下的相对 URL。默认为 `/`。

### 选项：`status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。这不适用于跨子网，除非您的路由器支持 mDNS 转发或 avahi。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求获取节点状态。 如果所有节点即便连接时也始终显示离线状态，请使用此选项。

### 选项：`streamer_mode`

如果设置为 `true`，这将启用流式模式，使 ESPHome 隐藏所有潜在的私人信息。 例如 WiFi (B)SSIDs（可能被用来查找您的位置）、用户名等。请注意，您需要在 YAML 文件中使用 `!secret` 标签，以防止在编辑和验证时显示这些信息。