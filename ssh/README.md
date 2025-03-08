# Home Assistant 社区插件：高级 SSH 和 Web 终端

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

此插件允许您使用 SSH 或通过 Web 终端登录到您的 Home Assistant 实例。

## 关于

此插件允许您使用 SSH 或 Web 终端登录到您的 Home Assistant 实例，给予您访问文件夹的权限，并且还包括一个命令行工具，以进行重启、更新和检查您的实例等操作。

这是由 Home Assistant 提供的 [SSH 插件][hass-ssh] 的增强版本，专注于安全性、可用性和灵活性，并且还提供了通过 Web 界面的访问。

![Home Assistant 前端中的 Web 终端][screenshot]

## 注意

高级 SSH 和 Web 终端插件功能强大，几乎可以访问您系统的所有工具和几乎所有硬件。

尽管此插件是在考虑安全的前提下精心创建和维护的，但在错误或缺乏经验的用户手中，可能会对您的系统造成损害。

## 特性

此插件当然提供一个基于 [OpenSSH][openssh] 的 SSH 服务器，同时也提供基于 Web 的终端（可以包含在您的 Home Assistant 前端中）。此外，它开箱即用提供以下功能：

- 直接从 Home Assistant 前端访问命令行！
- SSH 的安全默认配置：
  - 仅允许由配置的用户登录，即使创建更多用户也不例外。
  - 仅使用已知的安全密码和算法。
  - 限制登录尝试，以更好地抵御暴力破解攻击。
  - 许多其他安全调整，_此插件在所有 [ssh-audit] 检查中均通过无警告！_
    ![SSH-Audit 的结果][ssh-audit-image]
- 提供 SSH 兼容模式选项，允许旧客户端连接。
- 支持 Mosh，允许漫游并支持间歇性连接。
- 默认情况下禁用 SFTP 支持，但可由用户配置。
- 如果 Home Assistant 是通过通用 Linux 安装程序安装的，则兼容。
- 用户名可配置，因此 `root` 不再是强制的。
- 在插件重启之间持久化自定义 SSH 客户端设置和密钥。
- 日志级别，以便更容易地分类问题。
- 访问您的音频、UART/串行设备和 GPIO 引脚的硬件。
- 以更多的权限运行，使您能够调试和测试更多情况。
- 访问主机系统的 dbus。
- 可以访问运行在主机系统上的 Docker 实例。
- 在主机级网络上运行，允许您打开端口或运行小守护程序。
- 在启动时安装自定义 Alpine 包。这允许您安装每次登录时都会可用的工具。
- 在插件启动时执行自定义命令，以便您可以自定义 shell 以满足您的需求。
- [ZSH][zsh] 作为默认 shell。对于初学者来说更易于使用，对经验丰富的用户来说更高级。它甚至预加载了
  ["Oh My ZSH"][ohmyzsh]，并启用了一些插件。
- 开箱即用包含了一组合理的工具：curl、Wget、RSync、GIT、
  Nmap、Mosquitto 客户端、MariaDB/MySQL 客户端、Awake（“唤醒局域网”）、Nano、
  Vim、tmux 及一堆常用的网络工具。

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