# ESPHome开发插件

这是ESPHome插件的**开发**版本。

要部署生产节点，请使用主流发布插件。

该插件使用每天下午02:00 UTC自动构建的ESPHome版本，用于测试开发中的组件。请查看下面的`esphome_fork`配置以正确配置插件。一旦您更新配置，请确保重新构建镜像。

## 配置

**注意**：_当配置更改时，请记得重启插件。_

### 选项: `esphome_fork`

从一个fork或分支安装ESPHome。
例如，要测试一个拉取请求，请使用`pull/XXXX/head`，其中`XXXX`是PR编号，
或者您可以指定fork所有者的用户名和分支`username:branch`，这
假设库仍然名为`esphome`。

如果您需要在镜像更新之前测试开发分支上的最新提交，您可以在这里输入`dev`。

请注意，您使用的fork或分支**必须**与ESPHome开发版保持最新，
否则插件**将无法启动**。

## 一般ESPHome插件配置

一般选项在其他版本中也可用。

### 选项: `ssl`

启用或禁用与该插件的Web服务器的加密SSL/TLS (HTTPS) 连接。
将其设置为`true`以加密通信，反之则设置为`false`。
请注意，如果您将其设置为`true`，则还必须生成密钥和证书
文件以进行加密。例如，使用[Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
或[自签名证书](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/)。

### 选项: `certfile`

用于SSL的证书文件。如果此文件不存在，插件启动将失败。

**注意**：文件必须存储在`/ssl/`中，这是Home Assistant的默认位置。

### 选项: `keyfile`

用于SSL的私钥文件。如果此文件不存在，插件启动将失败。

**注意**：文件必须存储在`/ssl/`中，这是Home Assistant的默认位置。

### 选项: `leave_front_door_open`

在插件配置中添加此选项允许您通过设置为`true`来禁用
身份验证。

### 选项: `relative_url`

在相对URL下托管ESPHome仪表板，以便可以将其集成
到现有的Web代理（如NGINX）下的相对URL中。默认为`/`。

### 选项: `status_use_ping`

默认情况下，仪表板使用mDNS检查节点是否在线。这种方法
在子网之间不会工作，除非您的路由器支持mDNS转发或avahi。

将其设置为`true`将使ESPHome使用ICMP ping请求来获取节点状态。如果所有节点在连接时始终显示离线状态，请使用此选项。

### 选项: `streamer_mode`

如果设置为`true`，将启用流模式，这将使ESPHome隐藏所有
潜在的私人信息。例如WiFi (B)SSIDs（可能被用来找到您的位置）、用户名等。请注意，您需要在YAML文件中使用
`!secret`标签，以防止在编辑和验证时这些信息也显示出来。