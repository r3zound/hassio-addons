# Home Assistant 社区插件：高级 SSH 和 Web 终端

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

这个插件允许您通过 SSH 或 Web 终端登录到您的 Home Assistant 实例。

## 关于

这个插件允许您通过 SSH 或 Web 终端登录到您的 Home Assistant 实例，让您可以访问您的文件夹，并且还包括一个命令行工具来执行重启、更新和检查您的实例等操作。

这是 Home Assistant 提供的[SSH 插件][hass-ssh]的增强版，专注于安全性、可用性和灵活性，并提供使用 Web 界面的访问。

![Home Assistant 前端中的 Web 终端][screenshot]

## 警告

高级 SSH 和 Web 终端插件非常强大，并几乎可以访问您系统的所有工具和几乎所有硬件。

尽管这个插件是经过细心创建和维护的，并考虑到了安全性，但在错误或缺乏经验的使用者手中，可能会损坏您的系统。

## 功能

这个插件当然提供一个基于 [OpenSSH][openssh] 的 SSH 服务器和一个基于 Web 的终端（也可以包含在您的 Home Assistant 前端中）。此外，它开箱即用地提供以下功能：

- 直接从 Home Assistant 前端访问命令行！
- 安全的 SSH 默认配置：
  - 仅允许通过配置的用户登录，即使创建了更多用户。
  - 仅使用已知的安全密码和算法。
  - 限制登录尝试次数，以更好地抵御暴力攻击。
  - 许多其他安全调整，_这个插件在所有 [ssh-audit] 检查中均无警告！_
    ![SSH-Audit 结果][ssh-audit-image]
- 提供 SSH 兼容模式选项，以允许旧版客户端连接。
- 支持 Mosh，允许漫游并支持间歇性连接。
- 默认情况下禁用 SFTP 支持，但可由用户配置。
- 如果通过通用的 Linux 安装程序安装了 Home Assistant，则兼容。
- 用户名可配置，因此 `root` 不再是强制的。
- 在插件重启之间保持自定义 SSH 客户端设置和密钥。
- 日志级别允许您更轻松地排查问题。
- 硬件访问您的音频、UART/串行设备和 GPIO 引脚。
- 以更高的权限运行，让您能调试和测试更多情况。
- 访问主机系统的 dbus。
- 有权限访问在主机系统上运行的 Docker 实例。
- 在主机级别网络上运行，允许您打开端口或运行小型守护进程。
- 启动时安装自定义 Alpine 软件包。这允许您安装您喜欢的工具，这些工具在每次登录时都会可用。
- 在插件启动时执行自定义命令，以便您可以根据自己的喜好定制 shell。
- [ZSH][zsh] 作为其默认 shell。对初学者更友好，对更有经验的用户更为高级。它甚至预装了["Oh My ZSH"][ohmyzsh]，并启用了一些插件。
- 包含一整套合理的工具，直接可用：curl、Wget、RSync、GIT、Nmap、Mosquitto 客户端、MariaDB/MySQL 客户端、Awake（“在局域网唤醒”）、Nano、Vim、tmux，以及一堆常用的网络工具。

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