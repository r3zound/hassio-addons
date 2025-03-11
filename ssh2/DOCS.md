# Home Assistant 插件：终端与 SSH

## 安装

按照以下步骤在您的系统上安装插件：

1. 该插件仅对“高级模式”用户可见。要启用高级模式，请转到 **个人资料** -> 并打开 **高级模式**。
2. 在您的 Home Assistant 前端中，导航到 **设置** -> **插件** -> **插件商店**。
3. 找到“终端与 SSH”插件并点击它。
4. 点击“安装”按钮。

## 如何使用

此插件为您的 Home Assistant 安装添加了两个主要功能：

- 一个可从浏览器使用的网页终端，以及
- 启用使用 SSH 客户端连接到您的系统。

无论您如何连接（使用网页终端或使用 SSH 客户端），您最终都进入了该插件的容器。Home Assistant 配置目录位于路径 `/config`。

此插件还捆绑了 [Home Assistant CLI](https://www.home-assistant.io/common-tasks/os#home-assistant-via-the-command-line)。尝试以下命令：

```bash
ha help
```

### 网页终端

您可以通过点击该插件的“信息”选项卡上的“打开网页 UI”按钮来访问网页终端。如果您将“在侧边栏显示”设置（在同一信息选项卡中找到）设置为“开启”，则会在侧边栏添加一个快捷方式，方便您快速访问网页终端。

要从网页 UI 复制文本：
1. 按住 SHIFT 键。
2. 使用鼠标选择您要复制的文本。
3. 释放鼠标左键后，文本将被复制到您的系统剪贴板。

要将文本粘贴到网页 UI：
1. 按 SHIFT + INSERT。

### SSH 服务器连接

默认情况下，来自网络的远程 SSH 访问被禁用（请见下方的网络设置）。要使用 SSH 客户端（如 PuTTY 或 Linux 终端）连接，您需要为该插件提供额外的配置。要启用 SSH 连接，您需要：

- 提供身份验证凭证 - 密码或 SSH 密钥
- 指定要在 Home Assistant 主机上绑定的 TCP 端口

然后，您可以使用用户名 `root` 连接到指定的端口。请注意，启用 SSH 服务器可能会使您的 Home Assistant 系统的安全性降低，因为它可能使任何在互联网上的人尝试访问您的系统。您系统的安全性还取决于您的网络设置、路由器设置、防火墙使用情况等。一般建议是，除非您了解后果，否则不要激活插件的这一部分。

如果您启用使用 SSH 客户端连接到 SSH 服务器，强烈建议使用私钥/公钥进行登录。只要您保持密钥的私有部分安全，这将使您的系统更难以被攻破。因此，使用密码通常被认为是一种不那么安全的机制。要生成私钥/公钥 SSH 密钥，请按照 [Windows 的说明][keygen-windows] 和 [其他平台的说明][keygen]。

**注意**：在按照上述说明时，选择 ECDSA 作为 `生成密钥的类型`，而不是 RSA。RSA 不再受支持。

启用通过密码登录将禁用基于密钥的登录。您不能同时运行这两种变体。

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

您希望接受登录的 **公钥**。您可以通过将多个公钥添加到列表来授权多个密钥。

如果在添加密钥时遇到错误，很可能是您尝试添加的公钥包含与 YAML 语法冲突的字符。尝试用双引号括起来以避免此问题。

### 选项：`password`

设置登录密码。 **我们不推荐这种变体**。

### 选项组 `server`

一些 SSH 服务器选项。

#### 选项 `tcp_forwarding`

指定是否允许 TCP 端口转发（-L -R等）。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！不过，这个警告是有争议的。_

## 网络

本节仅在您希望使用 SSH 客户端（如 PuTTY 或 Linux 终端）连接到 Home Assistant 时相关。要启用来自网络的 SSH 远程访问，请在网络配置输入框中指定所需的 SSH TCP 服务器端口。您输入的数字将用于将该端口从主机映射到正在运行的“终端与 SSH”插件。用于 SSH 协议的标准端口为 `22`。  

可以通过清除输入框、保存配置并重启插件来再次禁用远程 SSH 访问。

## 已知问题和局限性

- 此插件不会让您以 root 身份安装软件包或执行任何操作。
  在 Home Assistant 中不起作用。

## 支持

有问题吗？

您可以通过几种方式获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[keygen-windows]: https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-putty-to-connect-to-a-vps
[keygen]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[reddit]: https://reddit.com/r/homeassistant