# Home Assistant 插件：终端 & SSH

## 安装

按照以下步骤在你的系统上安装插件：

1. 此插件仅对“高级模式”用户可见。要启用高级模式，请转到 **个人资料** -> 并打开 **高级模式**。
2. 在你的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
3. 找到“终端 & SSH”插件并点击它。
4. 点击“安装”按钮。

## 如何使用

此插件为你的 Home Assistant 安装添加了两个主要功能：

- 一个可以从浏览器使用的网页终端，和
- 启用使用 SSH 客户端连接到你的系统。

无论你如何连接（使用网页终端或使用 SSH 客户端），你都会进入该插件的容器。Home Assistant 配置目录位于路径 `/config`。

此插件包含 [The Home Assistant CLI](https://www.home-assistant.io/common-tasks/os#home-assistant-via-the-command-line)。尝试使用：

```bash
ha help
```

### 网页终端

你可以通过点击此插件的信息选项卡上的“打开网页 UI”按钮访问网页终端。如果你将“在侧边栏显示”设置（在同一信息选项卡中找到）设置为“开启”，则将向侧边栏添加一个快捷方式，以便你快速访问网页终端。

要从网页 UI 复制文本：
1. 按住 SHIFT 键。
2. 使用鼠标选择要复制的文本。
3. 释放左键时，文本将复制到你的系统剪贴板。

要在网页 UI 中粘贴文本：
1. 按 SHIFT + INSERT。

### SSH 服务器连接

默认情况下，网络远程 SSH 访问是禁用的（见下文的网络部分）。要使用 SSH 客户端（如 PuTTY 或 Linux 终端）连接，你需要为此插件提供额外的配置。要启用 SSH 连接，你需要：

- 提供身份验证凭据 - 密码或 SSH 密钥
- 指定要绑定的 TCP 端口，位于 Home Assistant 主机上

然后你可以使用用户名 `root` 连接到指定的端口。请注意，启用 SSH 服务器可能会使你的 Home Assistant 系统的安全性降低，因为这可能会使互联网上的任何人尝试访问你的系统。你系统的安全性还取决于你的网络设置、路由器设置、防火墙的使用等。一般建议，除非你知道其后果，否则不应启用插件的这一部分。

如果你启用通过 SSH 客户端连接到 SSH 服务器，强烈建议使用私钥/公钥进行登录。只要你保持私钥的安全，这将使你的系统更难被攻破。因此，使用密码通常被认为是一种安全性较低的机制。要生成私钥/公钥，请遵循 [Windows 的说明][keygen-windows] 和 [其他平台的说明][keygen]。

**注意**：在遵循上述说明时，选择 ECDSA 作为 `生成密钥的类型` 而不是 RSA。RSA 不再被支持。

通过密码启用登录将禁用基于密钥的登录。你无法同时运行这两种变体。

## 配置

插件配置：

```yaml
authorized_keys:
  - "ssh-rsa AKDJD3839...== my-key"
password: ''
apks: []
server:
  tcp_forwarding: false
```

### 选项： `apks`

要在插件容器中安装的附加软件包。

### 选项： `authorized_keys`

你希望接受登录的 **公钥**。你可以通过将多个公钥添加到列表中来授权多个密钥。

如果在添加密钥时出现错误，很可能是因为你要添加的公钥包含与 YAML 语法冲突的字符。尝试用双引号括住你的密钥以避免此问题。

### 选项： `password`

设置登录密码。**我们不推荐这种变体**。

### 选项组 `server`

一些 SSH 服务器选项。

#### 选项 `tcp_forwarding`

指定是否允许 TCP 端口转发（-L -R 等）。

**注意**：_启用此选项会降低 SSH 服务器的安全性！然而，这个警告是有争议的。_

## 网络

如果你希望使用 SSH 客户端（如 PuTTY 或 Linux 终端）连接到 Home Assistant，此部分才相关。要启用来自网络的 SSH 远程访问，请在网络配置输入框中指定所需的 SSH TCP 服务器端口。你输入的数字将被用来将该端口从主机映射到正在运行的“终端 & SSH”插件。SSH 协议的标准端口是 `22`。

可以通过清空输入框、保存配置并重新启动插件来禁用远程 SSH 访问。

## 已知问题和限制

- 此插件不会使你能够以 root 身份安装软件包或进行任何操作。
  这在 Home Assistant 中不起作用。

## 支持

有问题吗？

你有几种方式可以找到答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果你发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[keygen-windows]: https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-putty-to-connect-to-a-vps
[keygen]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[reddit]: https://reddit.com/r/homeassistant