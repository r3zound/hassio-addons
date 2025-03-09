# Home Assistant 插件：终端与 SSH

## 安装

请按照以下步骤在您的系统上安装该插件：

1. 此插件仅对“高级模式”用户可见。要启用高级模式，请前往 **个人资料** -> 并开启 **高级模式**。
2. 在您的 Home Assistant 前端中导航至 **设置** -> **插件** -> **插件商店**。
3. 查找“终端与 SSH”插件并点击它。
4. 点击“安装”按钮。

## 如何使用

此插件为您的 Home Assistant 安装添加了两个主要功能：

- 一个您可以从浏览器使用的网络终端，以及
- 允许使用 SSH 客户端连接到您的系统。

无论您是通过网页终端还是 SSH 客户端连接，您最终都会进入此插件的容器。Home Assistant 配置目录位于路径 `/config`。

该插件附带了 [Home Assistant CLI](https://www.home-assistant.io/common-tasks/os#home-assistant-via-the-command-line)。您可以使用以下命令进行尝试：

```bash
ha help
```

### 网络终端

您可以通过点击该插件信息选项卡上的“打开 Web UI”按钮访问网络终端。如果您将“侧边栏显示”设置（在同一信息选项卡中找到）设置为“开启”，将会在侧边栏添加一个快捷方式，使您能够快速访问网络终端。

要从 Web UI 复制文本：
1. 按住 SHIFT 键。
2. 使用鼠标选择要复制的文本。
3. 松开左键后，文本将复制到您的系统剪贴板中。

要在 Web UI 中粘贴文本：
1. 按 SHIFT + INSERT。

### SSH 服务器连接

默认情况下，网络的远程 SSH 访问是禁用的（详见下面的网络部分）。要使用 SSH 客户端（如 PuTTY 或 Linux 终端）连接，您需要为此插件提供额外的配置。要启用 SSH 连接，您需要：

- 提供身份验证凭据 - 密码或 SSH 密钥
- 指定要绑定到 Home Assistant 主机上的 TCP 端口

然后，您可以使用用户名 `root` 连接到指定的端口。请注意，启用 SSH 服务器可能会使您的 Home Assistant 系统的安全性降低，因为这可能会使互联网用户尝试访问您的系统。您系统的安全性还取决于您的网络设置、路由器设置、防火墙的使用等。一般建议，除非您理解其后果，否则不应启用插件的此部分。

如果您启用使用 SSH 客户端连接到 SSH 服务器，强烈建议使用私钥/公钥进行登录。只要您妥善保管密钥的私密部分，这将使您的系统更难以被突破。因此，使用密码通常被认为是一种安全性较低的机制。要生成私钥/公钥 SSH 密钥，请按照 [Windows 的说明][keygen-windows] 和 [其他平台的说明][keygen]。

**注意**：在执行上述说明时，请选择 ECDSA 作为 `生成密钥的类型`，而不是 RSA。RSA 不再被支持。

启用密码登录将禁用基于密钥的登录。您不能同时运行这两种变体。

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

### 选项：`apks`

要在插件容器中安装的其他软件包。

### 选项：`authorized_keys`

您希望接受登录的 **公钥**。您可以通过向列表中添加多个公钥来授权多个密钥。

如果在添加您的密钥时遇到错误，可能是您尝试添加的公钥包含与 YAML 语法冲突的字符。尝试将您的密钥用双引号括起来以避免此问题。

### 选项：`password`

为登录设置一个密码。**我们不推荐此变体**。

### 选项组 `server`

一些 SSH 服务器选项。

#### 选项 `tcp_forwarding`

指定是否允许 TCP 端口转发（-L -R 等）。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！然而，该警告是有争议的。_

## 网络

这一部分仅与您想通过 SSH 客户端（例如 PuTTY 或 Linux 终端）连接到 Home Assistant 相关。为了从网络启用 SSH 远程访问，请在网络配置输入框中指定期望的 SSH TCP 服务器端口。您输入的数字将用于将该端口从主机映射到正在运行的“终端与 SSH”插件。SSH 协议使用的标准端口是 `22`。

通过清除输入框、保存配置和重启插件，可以再次禁用远程 SSH 访问。

## 已知问题和限制

- 该插件不会允许您以 root 身份安装软件包或执行任何其他操作。
  这在 Home Assistant 中是无效的。

## 支持

有问题？

您有几个选项可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了一个bug，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[keygen-windows]: https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-putty-to-connect-to-a-vps
[keygen]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[reddit]: https://reddit.com/r/homeassistant