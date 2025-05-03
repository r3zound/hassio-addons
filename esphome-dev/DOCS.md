# ESPHome 开发版附加组件

这是 **开发** 版本的 ESPHome 附加组件。

要部署生产节点，请使用主流版本的附加组件。

此附加组件使用 ESPHome 的一个版本，该版本每天在 UTC 时间 02:00 自动构建，并用于测试开发中的组件。请查看下面的 `esphome_fork` 配置以正确配置附加组件。更新配置后，请确保重新构建镜像。

## 配置

**注意**：_记得在更改配置后重启附加组件。_

### 选项： `esphome_fork`

从一个分叉或分支安装 ESPHome。
例如，要测试一个拉取请求，可以使用 `pull/XXXX/head` 其中 `XXXX` 是 PR 编号，
或者你可以指定分叉拥有者的用户名和分支 `username:branch`，这假设库的名称仍然是 `esphome`。

如果你需要在镜像更新之前测试开发分支上的最新提交，你可以在这里输入 `dev`。

请注意，您使用的分叉或分支 **必须** 与 ESPHome 开发版保持最新，
否则附加组件 **将无法启动**。

## 通用 ESPHome 附加组件配置

通用选项也可在其他版本中使用。

### 选项： `ssl`

启用或禁用对该附加组件的Web服务器的加密SSL/TLS (HTTPS) 连接。
将其设置为 `true` 以加密通信，反之则为 `false`。
请注意，如果你将其设置为 `true`，你还必须生成密钥和证书
文件以进行加密。例如使用 [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或 [自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项： `certfile`

用于 SSL 的证书文件。如果该文件不存在，附加组件将无法启动。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项： `keyfile`

用于 SSL 的私钥文件。如果该文件不存在，附加组件将无法启动。

**注意**：该文件必须存储在 `/ssl/` 中，这是 Home Assistant 的默认位置。

### 选项： `leave_front_door_open`

将此选项添加到附加组件配置中，可以通过将其设置为 `true` 来禁用
身份验证。

### 选项： `relative_url`

在相对 URL 下托管 ESPHome 仪表板，以便可以将其集成到现有的网络代理中，如 NGINX。

默认值为 `/`。

### 选项： `status_use_ping`

默认情况下，仪表板使用 mDNS 检查节点是否在线。如果路由器不支持 mDNS 转发或 avahi，则
跨子网无法工作。

将此设置为 `true` 将使 ESPHome 使用 ICMP ping 请求来获取节点状态。如果所有节点即使连接时也始终显示离线状态，请使用此选项。

### 选项： `streamer_mode`

如果设置为 `true`，将启用流模式，这使得 ESPHome 隐藏所有
潜在的私人信息。例如 WiFi (B)SSIDs (可能被用来查找您的位置)、用户名等。请注意，你需要在 YAML 文件中使用
`!secret` 标签，以防止在编辑和验证时显示这些信息。