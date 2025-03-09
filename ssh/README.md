# Home Assistant Community Add-on: 高级 SSH 和 Web 终端

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

此增强插件允许您通过 SSH 登录到您的 Home Assistant 实例或使用 Web 终端。

## 关于

此插件允许您通过 SSH 或 Web 终端登录到您的 Home Assistant 实例，您可以访问您的文件夹，并且还包括一个命令行工具，可以执行如重启、更新和检查您的实例等操作。

这是 Home Assistant 提供的
[SSH 插件][hass-ssh] 的增强版本，专注于安全性、可用性和灵活性，并且还提供通过 Web 界面访问的功能。

![Home Assistant 前端中的 Web 终端][screenshot]

## 警告

高级 SSH 和 Web 终端插件是一个非常强大的工具，几乎可以让您访问系统的所有工具和几乎所有硬件。

虽然此插件是在考虑安全性的前提下由专人创建和维护的，但在不当或缺乏经验的手上，可能会损坏您的系统。

## 功能

此插件当然提供了基于 [OpenSSH][openssh] 的 SSH 服务器和基于 Web 的终端（可以包含在您的 Home Assistant 前端中）。此外，它开箱即用，包含以下功能：

- 可以直接从 Home Assistant 前端访问命令行！
- 一个安全的 SSH 默认配置：
  - 只允许经过配置的用户登录，即使创建了更多用户。
  - 只使用已知的安全密码和算法。
  - 限制登录尝试次数，以更好地防止暴力攻击。
  - 还有许多其他安全调整，_此插件通过所有的 [ssh-audit] 检查而没有警告！_
    ![SSH 审计结果][ssh-audit-image]
- 配备了 SSH 兼容模式选项，以允许旧客户端连接。
- 支持 Mosh，允许漫游并支持间歇性连接。
- 默认情况下禁用了 SFTP 支持，但可由用户配置。
- 如果 Home Assistant 通过通用 Linux 安装程序安装，则兼容。
- 用户名可配置，因此 `root` 不再是强制的。
- 在插件重启之间持久化自定义 SSH 客户端设置和密钥。
- 允许您更轻松地排查问题的日志级别。
- 访问您音频、uart/串口设备和 GPIO 引脚的硬件。
- 以更高的权限运行，允许您调试和测试更多情况。
- 可以访问主机系统的 dbus。
- 有权访问在主机系统上运行的 Docker 实例。
- 在主机级网络上运行，允许您打开端口或运行小守护程序。
- 启动时安装自定义 Alpine 包。这使您可以安装您喜欢的工具，这些工具将在每次登录时可用。
- 在插件启动时执行自定义命令，以便您可以自定义外壳以满足您的喜好。
- 默认使用 [ZSH][zsh] 作为其默认外壳。对于初学者来说更易于使用，对更有经验的用户来说更为高级。它甚至预装了
  [“Oh My ZSH”][ohmyzsh]，并启用了一些插件。
- 直接开箱即用包含了一组合理的工具：curl、Wget、RSync、GIT、
  Nmap、Mosquitto 客户端、MariaDB/MySQL 客户端、Awake（“局域网唤醒”）、Nano、
  Vim、tmux，以及一堆常用的网络工具。

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