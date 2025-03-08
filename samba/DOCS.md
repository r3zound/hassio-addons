# Home Assistant 附加组件：Samba 共享

## 安装

按照以下步骤在您的系统上安装附加组件：

1. 在 Home Assistant 前端中导航至 **设置** -> **附加组件** -> **附加组件商店**。
2. 找到 "Samba 共享" 附加组件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

1. 在配置部分，设置用户名和密码。
   您可以指定任何用户名和密码；这些与您用于登录 Home Assistant 的凭据或与您将使用 Samba 共享的计算机登录的凭据没有任何关系。
2. 检查已启用的共享。禁用您不打算使用的任何共享。如果需要，以后可以重新启用共享。

## 连接

如果您使用 Windows，您需要使用 `\\<IP_ADDRESS>\`，如果您使用 MacOS，则需使用 `smb://<IP_ADDRESS>` 连接到共享。

此附加组件通过 smb (samba) 暴露以下目录：

目录 | 描述
-- | --
`addons` | 这是您的本地附加组件。
`addon_configs` | 这是您的附加组件的配置文件。
`backup` | 这是您的备份。
`config` | 这是您的 Home Assistant 配置。
`media` | 这是本地媒体文件。
`share` | 这是您在附加组件和 Home Assistant 之间共享的数据。
`ssl` | 这是您的 SSL 证书。

## 配置

附加组件配置：

```yaml
workgroup: WORKGROUP
local_master: true
username: homeassistant
password: YOUR_PASSWORD
enabled_shares:
  - addons
  - addon_configs
  - backup
  - config
  - media
  - share
  - ssl
allow_hosts:
  - 10.0.0.0/8
  - 172.16.0.0/12
  - 192.168.0.0/16
  - 169.254.0.0/16
  - fe80::/10
  - fc00::/7
veto_files:
  - "._*"
  - ".DS_Store"
  - Thumbs.db
compatibility_mode: false
```

### 选项： `workgroup`（必需）

将 WORKGROUP 更改为反映您的网络需求。

### 选项： `local_master`（必需）

启用以尝试成为子网中的本地主浏览器。

### 选项： `username`（必需）

您希望用来与 Samba 服务器进行身份验证的用户名。

### 选项： `password`（必需）

与配置的用户名一起用于身份验证的密码。

### 选项： `enabled_shares`（必需）

可访问的 Samba 共享列表。任何从列表中删除或注释掉的共享将无法访问。

### 选项： `allow_hosts`（必需）

允许访问共享文件夹的主机/网络列表。

### 选项： `veto_files`（可选）

不可见且不可访问的文件列表。可用于阻止客户端
在共享中留下临时隐藏文件
（例如，macOS 的 `.DS_Store` 或 Windows 的 `Thumbs.db` 文件）

### 选项： `compatibility_mode`

将此选项设置为 `true` 将在 Samba 附加组件上启用旧的遗留 Samba 协议。这可能解决一些无法处理新协议的客户端的问题，但会降低安全性。仅在您绝对需要并了解可能的后果时使用此选项。

默认为 `false`。

## 支持

有问题吗？

您有几种方式可以得到答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了错误，请在我们的 GitHub 上 [提问][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository