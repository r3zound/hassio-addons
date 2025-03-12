# Home Assistant Community Add-on: 高级 SSH 和 Web 终端

此附加组件允许您使用 SSH 或 Web 终端登录到您的 Home Assistant 实例，访问您的文件夹，并包括一个命令行工具，可用于重新启动、更新和检查您的实例。

这是提供的 [Home Assistant 的 SSH 附加组件][hass-ssh] 的增强版本，重点关注安全性、可用性、灵活性，并提供使用 Web 界面的访问。

## 警告

高级 SSH 和 Web 终端附加组件功能强大，可以访问您系统几乎所有的工具和硬件。

虽然此附加组件是小心创建和维护的，并考虑了安全性，但在不当或缺乏经验的手中，它可能会损坏您的系统。

## 特性

此附加组件当然提供一个基于 [OpenSSH][openssh] 的 SSH 服务器，以及一个基于 Web 的终端（可以包含在您的 Home Assistant 前端中）。此外，它开箱即用地提供以下功能：

- 直接从 Home Assistant 前端访问命令行！
- 安全的 SSH 默认配置：
  - 仅允许配置的用户登录，即使创建了更多用户。
  - 仅使用已知的安全密码和算法。
  - 限制登录尝试次数，以更好地抵抗暴力破解攻击。
  - 许多更多的安全优化，_该附加组件通过所有 [ssh-audit] 检查而没有警告！_
    ![SSH-Audit 结果][ssh-audit-image]
- 提供 SSH 兼容模式选项，允许较旧的客户端连接。
- 支持 Mosh，允许漫游，并支持间歇性连接。
- 默认禁用 SFTP 支持，但可由用户配置。
- 如果通过通用 Linux 安装程序安装 Home Assistant，兼容性良好。
- 用户名可配置，因此 `root` 不再是强制的。
- 在附加组件重启之间保留自定义 SSH 客户端设置和密钥。
- 日志级别使您可以更轻松地调试问题。
- 访问您的音频、串行设备和 GPIO 引脚的硬件。
- 运行具有更高权限，允许您调试和测试更多情况。
- 可以访问主机系统的 dbus。
- 有选择使用在主机系统上运行的 Docker 实例。
- 在主机级别网络上运行，允许您打开端口或运行小型守护进程。
- 启动时安装自定义 Alpine 包。这允许您安装您最喜欢的工具，每次登录时都会可用。
- 在附加组件启动时执行自定义命令，以便您可以根据自己的喜好自定义 shell。
- 默认的 shell 是 [ZSH][zsh]。初学者更易于使用，对于更有经验的用户来说更为高级。它甚至预加载了 ["Oh My ZSH"][ohmyzsh]，并启用了某些插件。
- 直接开箱即用的理智工具集：curl、Wget、RSync、GIT、Nmap、Mosquitto 客户端、MariaDB/MySQL 客户端、Awake（“局域网唤醒”）、Nano、Vim、tmux 和一组常用的网络工具。

## 安装

此附加组件的安装相当直接，与安装任何其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant 我的按钮，在您的 Home Assistant 实例中打开附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

2. 点击“安装”按钮以安装附加组件。
3. 配置 `username` 和 `password`/`authorized_keys` 选项。
4. 启动“高级 SSH 和 Web 终端”附加组件。
5. 检查“高级 SSH 和 Web 终端”附加组件的日志，查看是否一切正常。

## 配置

**注意**：_更改配置后，请记得重启附加组件。_

SSH 附加组件配置：

```yaml
log_level: info
ssh:
  username: homeassistant
  password: ""
  authorized_keys:
    - ssh-ed25519 AASDJKJKJFWJFAFLCNALCMLAK234234.....
  sftp: false
  compatibility_mode: false
  allow_agent_forwarding: false
  allow_remote_port_forwarding: false
  allow_tcp_forwarding: false
zsh: true
share_sessions: true
packages:
  - build-base
init_commands:
  - ls -la
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更少详细，这在处理未知问题时可能会很有用。可能的值有：

- `trace`: 显示每个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 但不是错误的例外情况。
- `error`: 运行时错误，不需要立即处理。
- `fatal`: 出现严重错误，附加组件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

使用 `trace` 或 `debug` 日志级别会将 SSH 和终端守护进程置于调试模式。虽然 SSH 运行在调试模式下，但它将只能接受一次一个连接。

### 选项组 `ssh`

---

以下选项适用于选项组：`ssh`。这些设置仅适用于 SSH 守护进程。

#### 选项 `ssh`: `username`

此选项允许您更改使用 SSH 登录时的用户名。它仅用于身份验证；您在身份验证后将成为 `root` 用户。使用 `root` 作为用户名是可以的，但不推荐。用户名将根据推荐的做法转换为小写。

**注意**：_由于限制，您需要将此选项设置为 `root` 以便启用 SFTP 功能。_

#### 选项 `ssh`: `password`

设置用于登录的密码。将其留空将禁用使用密码进行身份验证的可能性。从安全角度建议不要使用此选项。

#### 选项 `ssh` `authorized_keys`

向您的 SSH 服务器添加一个或多个公钥以用于身份验证。这是推荐的方式，而不是设置密码。

请查看 GitHub 上创建的出色 [文档][github-ssh]，了解如何使用公/私密钥对并如何创建它们。

**注意**：_请确保密钥通过粘贴在 `[]` 内以逗号分隔的方式指定为列表。_

#### 选项 `ssh`: `sftp`

当设置为 `true` 时，附加组件将启用 SSH 守护进程上的 SFTP 支持。请仅在计划使用时启用此功能。

**注意**：_由于限制，您需要将用户名设置为 `root` 以便启用 SFTP 功能。_

#### 选项 `ssh`: `compatibility_mode`

此 SSH 附加组件专注于安全性，因此仅启用了已知的安全加密方法。然而，一些较旧的客户端不支持这些方法。将此选项设置为 `true` 将启用原始默认方法集，允许这些客户端连接。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！_

#### 选项 `ssh`: `allow_agent_forwarding`

指定是否允许 ssh-agent 转发。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！尽管如此，这一警告是有争议的。_

#### 选项 `ssh`: `allow_remote_port_forwarding`

指定是否允许远程主机连接到为客户端转发的端口。

**注意**：_启用此功能影响所有远程转发，因此请在执行此操作之前仔细考虑。_

#### 选项 `ssh`: `allow_tcp_forwarding`

指定是否允许 TCP 转发。

**注意**：_启用此选项会降低您的 SSH 服务器的安全性！尽管如此，这一警告是有争议的。_

### 共享设置

---

以下选项在 SSH 和 Web 终端之间共享。

#### 选项：`zsh`

此附加组件预安装并将 ZSH 配置为默认 shell。然而，ZSH 可能不是您首选的。通过将此选项设置为 `false`，您将禁用 ZSH，附加组件将改回 Bash。

#### 选项：`share_sessions`

默认情况下，Web 客户端和 SSH 之间的终端会话是共享的。这样可以让您从这两个地方继续上次的终端。

此选项允许您通过将其设置为 `false` 来禁用此行为，从而使 SSH 行为与以前一样。

#### 选项：`packages`

允许您指定要在您的 shell 环境中安装的其他 [Alpine 包][alpine-packages]（例如，Python、Joe、Irssi）。

**注意**：_添加许多包会导致附加组件的启动时间变长。_

#### 选项：`init_commands`

通过 `init_commands` 选项进一步自定义您的 shell 环境。将一个或多个 shell 命令添加到列表中，它们将在每次启用此附加组件时执行。

## 已知问题和限制

- 当 SFTP 启用时，用户名必须设置为 `root`。
- 如果您想使用 rsync 进行文件传输，用户名必须设置为 `root`。

## 更新日志与发布

本存储库使用 [GitHub 的发布][releases] 功能维护更改日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容的或重大变更。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的bug修复和包更新。

## Visual Studio Code 远程 - SSH

设置以下参数，如所示，将允许您使用 VSCode Remote - SSH 连接到您的 Home Assistant 实例：

```yaml
ssh:
  allow_remote_port_forwarding: true
  allow_tcp_forwarding: true
```

## 支持

有问题？

您可以通过多种方式获得解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 论坛][reddit]。

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 进行。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2017-2025 Franck Nijhof

特此授予任何获得本软件及其相关文档文件（“软件”）副本的人免费使用该软件的权限，以不受限制地进行处理，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本的权限，并允许向其提供该软件的人这么做，前提是符合以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质部分中。

该软件是“按原样”提供的，不附有任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有者均不对因使用本软件或其他交易引起的任何索赔、损害或其他责任承担责任，不论是在合同行动、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_ssh&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[alpine-packages]: https://pkgs.alpinelinux.org/packages
[contributors]: https://github.com/hassio-addons/addon-ssh/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-ssh-web-terminal/33820?u=frenck
[frenck]: https://github.com/frenck
[github-ssh]: https://help.github.com/articles/connecting-to-github-with-ssh/
[hass-ssh]: https://github.com/home-assistant/addons/tree/master/ssh
[issue]: https://github.com/hassio-addons/addon-ssh/issues
[ohmyzsh]: http://ohmyz.sh/
[openssh]: https://www.openssh.com/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-ssh/releases
[semver]: https://semver.org/spec/v2.0.0.html
[ssh-audit-image]: https://github.com/hassio-addons/addon-ssh/raw/main/images/ssh-audit.png
[ssh-audit]: https://github.com/jtesta/ssh-audit
[zsh]: https://en.wikipedia.org/wiki/Z_shell