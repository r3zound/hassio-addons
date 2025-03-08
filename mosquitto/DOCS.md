# Home Assistant 插件：Mosquitto 代理

## 安装

按照以下步骤在您的系统上安装插件：

1. 在 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到“Mosquitto 代理”插件并单击它。
3. 点击“安装”按钮。

## 如何使用

该插件有一些可用选项。要使插件运行：

1. 启动插件。
2. 耐心等待几分钟。
3. 检查插件日志输出以查看结果。

通过 Home Assistant 的前端 **设置** -> **人员** -> **用户** 创建一个新的 MQTT 用户（即，不在 Mosquitto 的 **配置** 选项卡上）。
注意事项：

1. 该名称不能为 `homeassistant` 或 `addons`，这些是保留的用户名。
2. 如果您没有看到创建新用户的选项，请确保在您的 Home Assistant 个人资料中启用了 **高级模式**。

要将 Mosquitto 用作代理，前往集成页面，并通过一次点击安装配置：

1. 在 Home Assistant 前端中导航到 **设置** -> **设备与服务** -> **集成**。
2. MQTT 应该出现在页面顶部作为已发现的集成。
3. 选择它，然后勾选框以启用 MQTT 发现（如有需要），然后点击提交。

如果您有旧的 MQTT 设置，请删除该旧集成并重启 Home Assistant 以查看新的集成。

## 配置

插件配置：

```yaml
logins: []
customize:
  active: false
  folder: mosquitto
certfile: fullchain.pem
keyfile: privkey.pem
require_certificate: false
```

### 选项：`logins`（可选）

将创建本地用户的用户名和密码列表。您无需这样做，因为您也可以使用 Home Assistant 用户，而无需任何配置。如果确实需要本地用户：

```yaml
logins:
  - username: user
    password: passwd
```

您还可以选择使用从 `pw` 命令（该命令存在于 Mosquitto 容器内）获得的哈希密码设置 `password` 值。如果这样做，您还必须在 `username` 和 `password` 值旁边指定 `password_pre_hashed: true`：

```console
$ pw -p "foo"
PBKDF2$sha512$100000$qsU7xQ8YCV/9nRuBBJVTxA==$jqw94Ej3aEr97UofY6rClmVCRkTdDiubQW0A6ZYmUI+pZjW9Hax+2w2FeYB3y5ut1SliB7+HAwIl2iONLKkohw==
```

```yaml
logins:
  - username: user
    password: "PBKDF2$sha512$100000$qsU7xQ8YCV/9nRuBBJVTxA==$jqw94Ej3aEr97UofY6rClmVCRkTdDiubQW0A6ZYmUI+pZjW9Hax+2w2FeYB3y5ut1SliB7+HAwIl2iONLKkohw=="
    password_pre_hashed: true
```

**注意：** 此插件不支持匿名登录；所有连接必须使用用户名/密码进行连接。 `allow_anonymous true` 或任何匿名 ACL 将无法与此插件一起使用。

#### 选项：`customize.active`

如果设置为 `true`，则将读取附加配置文件，请参见下一个选项。

默认值：`false`

#### 选项：`customize.folder`

读取附加配置文件 (`*.conf`) 的文件夹。

### 选项：`cafile`（可选）

包含根证书的文件。将此文件放入 Home Assistant 的 `ssl` 文件夹中。

### 选项：`certfile`

包含证书及其链的文件。将此文件放入 Home Assistant 的 `ssl` 文件夹中。

**关于 `certfile` 和 `keyfile` 的注意事项**  
- 如果未提供 `certfile` 和 `keyfile`
  - 可以在未加密的端口上使用未加密的连接（默认：`1883`，`1884` 用于 WebSocket）
- 如果提供了 `certfile` 和 `keyfile`
  - 可以在未加密的端口上使用未加密的连接（默认：`1883`，`1884` 用于 WebSocket）
  - 可以在加密的端口上使用加密的连接（默认：`8883`，`8884` 用于 WebSocket） 
     - 在这种情况下，客户端必须信任服务器的证书

### 选项：`keyfile`

包含私钥的文件。将此文件放入 Home Assistant 的 `ssl` 文件夹中。

**关于 `certfile` 和 `keyfile` 的注意事项**  
- 如果未提供 `certfile` 和 `keyfile`
  - 可以在未加密的端口上使用未加密的连接（默认：`1883`，`1884` 用于 WebSocket）
- 如果提供了 `certfile` 和 `keyfile`
  - 可以在未加密的端口上使用未加密的连接（默认：`1883`，`1884` 用于 WebSocket）
  - 可以在加密的端口上使用加密的连接（默认：`8883`，`8884` 用于 WebSocket） 
     - 在这种情况下，客户端必须信任服务器的证书

### 选项：`require_certificate`

如果设置为 `false`：
- 客户端 **不需要** 提供证书即可连接，用户名/密码足够
- 忽略 `cafile` 选项

如果设置为 `true`：
- 客户端 **必须** 提供自己的证书才能连接，用户名/密码 _不_ 足够
- 必须提供一个证书颁发机构（CA）：`cafile` 选项
- 客户端证书必须由提供的 CA (`cafile`) 签署

### 选项：`debug`

如果设置为 `true`，则开启 Mosquitto 及其身份验证插件的调试日志。这在跟踪问题时会有所帮助，但长期运行不建议，因为敏感信息将被记录。

## Home Assistant 用户管理

此插件与 Home Assistant 用户系统关联，因此 MQTT 客户端可以使用这些凭据。本地用户仍然可以在插件的配置选项中独立设置。对于内部 Home Assistant 生态系统，我们注册 `homeassistant` 和 `addons`，因此这些不能用作用户名。

## 禁用对不安全端口（1883/1884）的监听

从插件页面的网络卡中删除端口（将其设置为空）以禁用这些端口。

### 访问控制列表（ACLs）

可以根据登录到 Mosquitto 的用户限制对主题的访问。在这种情况下，建议为每个客户端创建单独的用户，并创建相应的 ACL。

有关更多信息，请参见以下链接：

- [Mosquitto 主题限制](http://www.steves-internet-guide.com/topic-restriction-mosquitto-configuration/)
- [Mosquitto.conf 手册页](https://mosquitto.org/man/mosquitto-conf-5.html)

添加以下配置以启用对 `[YOUR_MQTT_USER]` 的所有主题的 **无限制** 访问。

**注意：** Home Assistant 期望用户 `homeassistant` 和 `addons` 对所有主题具有无限制的读写访问。如果您选择启用 ACL，您应该像下面演示的那样授予这些用户此访问权限。否则您将遇到问题。

1. 启用自定义标志

    ```yaml
      customize:
        active: true
        folder: mosquitto
    ```

2. 创建 `/share/mosquitto/acl.conf`，内容为：

    ```text
    acl_file /share/mosquitto/accesscontrollist
    ```

3. 创建 `/share/mosquitto/accesscontrollist`，内容为：

    ```text
    user addons
    topic readwrite #
    
    user homeassistant
    topic readwrite #
    
    user [YOUR_MQTT_USER]
    topic readwrite #
    ```

`/share` 文件夹可以通过 SMB 访问，或在主文件系统下的 `/usr/share/hassio/share` 中找到。

## 支持

有问题吗？

您有几种选项可以获得答案：

- Home Assistant Discord 聊天服务器。
- Home Assistant 社区论坛。
- 加入 Reddit 子版块中的 [Reddit subreddit][reddit] 在 [/r/homeassistant][reddit]

如果您发现了一个 bug，请在我们的 GitHub 上 [打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository
[mosquitto]: https://mosquitto.org/