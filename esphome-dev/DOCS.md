# ESPHome开发插件

这是**开发**版本的ESPHome插件。

要部署生产节点，请使用主流发行版插件。

该插件使用每天在02:00 UTC自动构建的ESPHome版本，并用于测试开发中的组件。请查看下面的`esphome_fork`配置以正确配置插件。更新配置后，请确保重新构建镜像。

## 配置

**注意**：_当配置发生更改时，请记得重启插件。_

### 选项：`esphome_fork`

从一个fork或分支安装ESPHome。
例如，要测试一个拉取请求，可以使用`pull/XXXX/head`，其中`XXXX`是PR编号，
或者您可以指定fork所有者的用户名和分支`username:branch`，这假设
仓库仍然命名为`esphome`。

如果需要在镜像更新之前测试开发分支上的最新提交，您可以在此输入`dev`。

请注意，您使用的fork或分支**必须**与ESPHome开发版保持最新，
否则插件**将无法启动**。

## 通用ESPHome插件配置

其他版本中也提供通用选项。

### 选项：`ssl`

启用或禁用与该插件的Web服务器的加密SSL/TLS（HTTPS）连接。
将其设置为`true`以加密通信，`false`则关闭。
请注意，如果您将其设置为`true`，则必须生成用于加密的密钥和证书
文件。例如使用[Let’s Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或[自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项：`certfile`

用于SSL的证书文件。如果此文件不存在，则插件启动将失败。

**注意**：文件必须存储在`/ssl/`中，这是Home Assistant的默认位置。

### 选项：`keyfile`

用于SSL的私钥文件。如果此文件不存在，则插件启动将失败。

**注意**：文件必须存储在`/ssl/`中，这是Home Assistant的默认位置。

### 选项：`leave_front_door_open`

将此选项添加到插件配置中可以通过将其设置为`true`来禁用
身份验证。

### 选项：`relative_url`

在相对URL下托管ESPHome仪表板，以便可以集成
到现有的网络代理中，例如按照相对URL的NGINX。默认为`/`。

### 选项：`status_use_ping`

默认情况下，仪表板使用mDNS检查节点是否在线。除非路由器支持mDNS转发或avahi，否则这在子网之间无效。

将其设置为`true`将使ESPHome使用ICMP ping请求来获取节点状态。如果所有节点即使在连接时也始终显示离线状态，请使用此选项。

### 选项：`streamer_mode`

如果设置为`true`，这将启用 Streamer 模式，使 ESPHome 隐藏所有潜在的私人信息。例如WiFi (B)SSIDs（可能用于查找您的位置）、用户名等。请注意，在编辑和验证时，您需要在YAML文件中使用`!secret`标签以防止这些信息显示出来。