# Home Assistant 插件：终端和 SSH

## 安装

按照以下步骤在您的系统上安装插件：

1. 此插件仅对“高级模式”用户可见。要启用高级模式，请转到 **个人资料** -> 并打开 **高级模式**。
2. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
3. 找到“终端与 SSH”插件并点击它。
4. 点击“安装”按钮。

## 如何使用

此插件为您的 Home Assistant 安装添加了两个主要功能：

- 一个可以在浏览器中使用的 web 终端，以及
- 启用使用 SSH 客户端连接到您的系统。

无论您如何连接（使用 web 终端或使用 SSH 客户端），您最终都进入此插件的容器。Home Assistant 配置目录位于路径 `/config`。

此插件捆绑了 [Home Assistant CLI](https://www.home-assistant.io/common-tasks/os#home-assistant-via-the-command-line)。尝试使用以下命令：

```bash
ha help
```

### Web 终端

您可以通过点击此插件的信息标签上的“打开 Web UI”按钮访问 web 终端。如果您将“在侧边栏中显示”设置（在同一信息标签上）设置为“开启”，则会在侧边栏添加一个快捷方式，以便您快速访问 web 终端。

要从 Web UI 复制文本：
1. 按住 SHIFT 键。
2. 使用鼠标选择要复制的文本。
3. 当释放左键时，文本将被复制到您的系统剪贴板中。

要将文本粘贴到 Web UI：
1. 按 SHIFT + INSERT。

### SSH 服务器连接

默认情况下，远程 SSH 访问在网络中被禁用（见下文网络部分）。要使用 SSH 客户端（如 PuTTY 或 Linux 终端）进行连接，您需要为此插件提供额外的配置。要启用 SSH 连接，您需要：

- 提供身份验证凭据 - 密码或 SSH 密钥
- 指定要绑定的 TCP 端口，在 Home Assistant 主机上

然后，您可以使用用户名 `root` 连接到指定的端口。请注意，启用 SSH 服务器可能会使您的 Home Assistant 系统的安全性降低，因为这可能允许互联网上的任何人尝试访问您的系统。您系统的安全性还取决于您的网络设置、路由器设置、防火墙的使用等。作为一般建议，除非您理解后果，否则不应激活插件的这个部分。

如果您启用使用 SSH 客户端连接到 SSH 服务器，强烈建议使用私钥/公钥进行登录。只要您保持密钥的私钥安全，这可以使您的系统更难被攻破。因此，使用密码通常被认为是一种安全性较低的机制。要生成私钥/公钥 SSH 密钥，请遵循 [Windows 的说明][keygen-windows] 和 [其他平台的说明][keygen]。

**注意**：在按照上述说明时，选择 ECDSA 作为 `生成的密钥类型`，而不是 RSA。RSA 不再受支持。

启用通过密码登录将禁用基于密钥的登录。您无法同时运行这两种变体。

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

要在插件容器中安装的额外软件包。

### 选项：`authorized_keys`

您希望接受登录的 **公钥**。您可以通过将多个公钥添加到列表中来授权多个密钥。

如果在添加密钥时出现错误，可能是您尝试添加的公钥包含干扰 YAML 语法的字符。尝试将密钥用双引号括起来以避免此问题。

### 选项：`password`

为登录设置密码。**我们不推荐这种变体**。

### 选项组 `server`

一些 SSH 服务器选项。

#### 选项 `tcp_forwarding`

指定是否允许 TCP 端口转发（-L -R 等）。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！但是，这个警告是有争议的。_

## 网络

此部分仅与您希望使用 SSH 客户端（如 PuTTY 或 Linux 终端）连接到 Home Assistant 相关。要启用来自网络的 SSH 远程访问，请在网络配置输入框中指定所需的 SSH TCP 服务器端口。您输入的数字将用于将该端口从主机映射到运行中的“终端与 SSH”插件。用于 SSH 协议的标准端口是 `22`。

可以通过清除输入框、保存配置并重启插件来再次禁用远程 SSH 访问。

## 已知问题和限制

- 此插件将不允许您以 root 身份安装软件包或进行任何操作。
  这在 Home Assistant 中是无法工作的。

## 支持

有问题吗？

您有几种选项可以获得答案：

- Home Assistant Discord 聊天服务器 [discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit]。

如果您发现了一个 bug，请 [在我们的 GitHub 上报告][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[keygen-windows]: https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-putty-to-connect-to-a-vps
[keygen]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[reddit]: https://reddit.com/r/homeassistant