# Home Assistant 社区附加组件：高级 SSH 和网络终端

[![发布][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![Discord][discord-shield]][discord] [![社区论坛][forum-shield]][forum]

[![通过 GitHub Sponsors 支持 Frenck][github-sponsors-shield]][github-sponsors]

[![在 Patreon 上支持 Frenck][patreon-shield]][patreon]

此附加组件允许您通过 SSH 或 Web 终端登录到您的 Home Assistant 实例。

## 关于

此附加组件允许您通过 SSH 或网络终端登录到您的 Home Assistant 实例，让您可以访问您的文件夹，并且还包括一个命令行工具来执行重启、更新和检查您的实例等操作。

这是 Home Assistant 提供的 [SSH 附加组件][hass-ssh] 的增强版，专注于安全性、可用性、灵活性，并且还提供了通过 Web 界面访问的功能。

![Home Assistant 前端中的 Web 终端][screenshot]

## 警告

高级 SSH 和网络终端附加组件功能非常强大，几乎可以访问系统的所有工具和几乎所有硬件。

虽然此附加组件经过精心创建和维护，并考虑了安全性，但在错误或经验不足的手中，它可能会损坏您的系统。

## 特性

此附加组件当然提供了一个基于 [OpenSSH][openssh] 的 SSH 服务器，以及一个基于网络的终端（也可以包含在您的 Home Assistant 前端中）。此外，它还开箱即用地附带以下内容：

- 直接从 Home Assistant 前端访问命令行！
- SSH 的安全默认配置：
  - 仅允许配置的用户登录，即使创建了更多用户。
  - 仅使用已知的安全密码和算法。
  - 限制登录尝试，以更好地防止暴力攻击。
  - 更多的安全调整，_此附加组件在所有 [ssh-audit] 检查中都没有警告！_
    ![SSH-Audit 的结果][ssh-audit-image]
- 具有 SSH 兼容模式选项，以允许旧客户端连接。
- 支持 Mosh，允许漫游并支持间歇性连接。
- 默认禁用 SFTP 支持，但可由用户配置。
- 如果通过通用 Linux 安装程序安装了 Home Assistant，则兼容。
- 用户名是可配置的，因此不再强制使用 `root`。
- 在附加组件重启之间保持自定义 SSH 客户端设置和密钥。
- 日志级别，便于您更轻松地排查问题。
- 对您的音频、UART/串行设备和 GPIO 引脚的硬件访问。
- 以更高权限运行，使您能够调试和测试更多情况。
- 访问主机系统的 dbus。
- 可以访问主机系统上运行的 Docker 实例。
- 在主机级别网络上运行，允许您打开端口或运行小的守护程序。
- 在启动时安装自定义 Alpine 包。这使您能够安装您喜欢的工具，这些工具将在每次登录时都可用。
- 在附加组件启动时执行自定义命令，以便您可以根据自己的喜好自定义 shell。
- 默认使用 [ZSH][zsh] 作为其 shell。对于初学者更易于使用，对于更有经验的用户则更加高级。它甚至预加载了 ["Oh My ZSH"][ohmyzsh]，并启用了一些插件。
- 直接开箱即用包含一组合理的工具：curl、Wget、RSync、GIT、Nmap、Mosquitto 客户端、MariaDB/MySQL 客户端、Awake（“局域网唤醒”）、Nano、Vim、tmux，以及一堆常用的网络工具。

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-ssh-web-terminal/33820?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[hass-ssh]: https://home-assistant.io/addons/ssh/
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[ohmyzsh]: http://ohmyz.sh/
[openssh]: https://www.openssh.com/
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v20.0.2-blue.svg
[release]: https://github.com/hassio-addons/addon-ssh/tree/v20.0.2
[screenshot]: https://github.com/hassio-addons/addon-ssh/raw/main/images/screenshot.png
[ssh-audit-image]: https://github.com/hassio-addons/addon-ssh/raw/main/images/ssh-audit.png
[ssh-audit]: https://github.com/jtesta/ssh-audit
[zsh]: https://en.wikipedia.org/wiki/Z_shell