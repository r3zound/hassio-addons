# Home Assistant 插件：Samba 共享

## 安装

按照以下步骤在您的系统上安装插件：

1. 在 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Samba 共享" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

1. 在配置部分，设置用户名和密码。
   您可以指定任何用户名和密码；这些与您用于登录 Home Assistant 或登录使用 Samba 共享的计算机的凭据没有任何关系。
2. 检查已启用的共享。禁用任何您不打算使用的共享。如果需要，可以稍后重新启用共享。

## 连接

如果您使用 Windows 请使用 `\\<IP_ADDRESS>\`，如果您使用 MacOS 请使用 `smb://<IP_ADDRESS>` 连接到共享。

此插件通过 smb (samba) 暴露以下目录：

目录 | 描述
-- | --
`addons` | 这是您的本地插件。
`addon_configs` | 这是您的插件的配置文件。
`backup` | 这是您的备份文件。
`config` | 这是您的 Home Assistant 配置。
`media` | 这是本地媒体文件。
`share` | 这是在插件和 Home Assistant 之间共享的数据。
`ssl` | 这是您的 SSL 证书。

## 配置

插件配置：

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

### 选项：`workgroup`（必需）

将 WORKGROUP 更改为反映您的网络需求。

### 选项：`local_master`（必需）

启用以尝试在子网中成为本地主浏览器。

### 选项：`username`（必需）

您希望用于对 Samba 服务器进行身份验证的用户名。

### 选项：`password`（必需）

与用于身份验证的用户名对应的密码。

### 选项：`enabled_shares`（必需）

将可访问的 Samba 共享的列表。删除或注释掉列表中的任何共享将无法访问。

### 选项：`allow_hosts`（必需）

允许访问共享文件夹的主机/网络列表。

### 选项：`veto_files`（可选）

不显示也不可访问的文件列表。用于防止客户端在共享中留下临时隐藏文件
（例如，macOS 的 `.DS_Store` 或 Windows 的 `Thumbs.db` 文件）

### 选项：`compatibility_mode`

将此选项设置为 `true` 将启用 Samba 插件上的旧遗留 Samba 协议。这可能解决一些无法处理新协议的客户端的问题，但会降低安全性。只有在绝对需要且了解可能后果时才使用此选项。

默认为 `false`。

## 支持

有问题吗？

您可以通过以下几种方式找到答案：

- Home Assistant [Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果您发现了错误，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository