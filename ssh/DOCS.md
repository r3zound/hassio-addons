# Home Assistant 附加组件：终端与SSH

## 安装

按照以下步骤在您的系统上安装附加组件：

1. 此附加组件仅对“高级模式”用户可见。要启用高级模式，请转到 **个人资料** -> 然后打开 **高级模式**。
2. 在您的 Home Assistant 前端中导航至 **设置** -> **附加组件** -> **附加组件商店**。
3. 找到“终端与SSH”附加组件并点击。
4. 点击“安装”按钮。

## 如何使用

此附加组件为您的 Home Assistant 安装添加了两个主要功能：

- 一个可以从浏览器使用的网络终端，以及
- 允许使用 SSH 客户端连接到您的系统。

无论您是如何连接的（使用网络终端或使用 SSH 客户端），您最终都进入此附加组件的容器。Home Assistant 配置目录位于路径 `/config`。

此附加组件捆绑了 [Home Assistant CLI](https://www.home-assistant.io/common-tasks/os#home-assistant-via-the-command-line)。可以通过以下命令尝试：

```bash
ha help
```

### 网络终端

您可以通过点击此附加组件信息标签上的“打开网络界面”按钮访问网络终端。如果您将“在侧边栏显示”设置（在相同的 信息 标签上找到）设置为“开启”，则会在侧边栏添加一个快捷方式，方便您快速访问网络终端。

从网络界面复制文本的方法：
1. 按住 SHIFT 键。
2. 使用鼠标选中要复制的文本。
3. 释放左键后，文本将被复制到您的系统剪贴板。

向网络界面粘贴文本的方法：
1. 按 SHIFT + INSERT。

### SSH 服务器连接

默认情况下，网络中的远程 SSH 访问是禁用的（请参见下面的网络部分）。要使用 SSH 客户端（例如 PuTTY 或 Linux 终端）连接，您需要为此附加组件提供额外的配置。要启用 SSH 连接，您需要：

- 提供认证凭据 - 密码或 SSH 密钥
- 指定要绑定到 Home Assistant 主机的 TCP 端口

然后，您可以使用用户名 `root` 连接到指定的端口。请注意，启用 SSH 服务器可能会使您的 Home Assistant 系统的安全性降低，因为这可能允许互联网上的任何人尝试访问您的系统。您的系统安全性还取决于您的网络设置、路由器设置、防火墙使用等。一般建议是，除非您了解其后果，否则不应启用附加组件的这一部分。

如果您启用使用 SSH 客户端连接到 SSH 服务器，强烈建议您使用私钥/公钥进行登录。只要您确保私钥的安全，这将使您的系统更难被攻破。因此，使用密码通常被认为是一种不太安全的机制。有关生成私钥/公钥的说明，请遵循 [Windows 的说明][keygen-windows] 和 [其他平台的说明][keygen]。

**注意**：在遵循上述说明时，选择 ECDSA 作为 `要生成的密钥类型` 而不是 RSA。RSA 不再受支持。

启用密码登录将禁用基于密钥的登录。您不能同时运行这两种变体。

## 配置

附加组件配置：

```yaml
authorized_keys:
  - "ssh-rsa AKDJD3839...== my-key"
password: ''
apks: []
server:
  tcp_forwarding: false
```

### 选项：`apks`

要在附加组件容器中安装的其他软件包。

### 选项：`authorized_keys`

您希望接受的 **公钥** 以用于登录。您可以通过将多个公钥添加到列表中来授权多个密钥。

如果在添加您的密钥时出现错误，可能是您尝试添加的公钥包含干扰 YAML 语法的字符。尝试使用双引号将密钥括起来以避免此问题。

### 选项：`password`

设置登录密码。**我们不推荐这种变体**。

### 选项组 `server`

一些 SSH 服务器选项。

#### 选项 `tcp_forwarding`

指定是否允许 TCP 端口转发（-L -R 等）。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！不过，这个警告是有争议的。_

## 网络

如果您想使用 SSH 客户端（例如 PuTTY 或 Linux 终端）连接到 Home Assistant，此部分特别相关。要启用网络中的 SSH 远程访问，请在网络配置输入框中指定所需的 SSH TCP 服务器端口。您输入的数字将用于将该端口从主机映射到正在运行的“终端与SSH”附加组件。SSH 协议使用的标准端口是 `22`。

可以通过清空输入框、保存配置并重启附加组件来再次禁用远程 SSH 访问。

## 已知问题和限制

- 此附加组件不会允许您以 root 用户身份安装软件包或执行任何其他操作。
  这在 Home Assistant 中不起作用。

## 支持

有问题吗？

您有几种选择可以获得解答：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上提交问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[keygen-windows]: https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-putty-to-connect-to-a-vps
[keygen]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[reddit]: https://reddit.com/r/homeassistant