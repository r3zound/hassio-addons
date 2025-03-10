# Home Assistant社区插件：高级SSH与Web终端

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

此插件允许您通过SSH或使用Web终端登录到您的Home Assistant实例。

## 关于

此插件允许您通过SSH或Web终端登录到您的Home Assistant实例，您可以访问您的文件夹，并包括一个命令行工具，用于进行重启、更新和检查您的实例等操作。

这是提供的[Home Assistant SSH插件][hass-ssh]的增强版本，专注于安全性、可用性和灵活性，并提供使用Web界面的访问。

![Home Assistant前端中的Web终端][screenshot]

## 警告

高级SSH与Web终端插件是一个非常强大的工具，几乎可以访问您系统的所有工具和几乎所有硬件。

虽然此插件是经过仔细创建和维护的，并考虑到安全性，但在错误或缺乏经验的操作下，可能会损坏您的系统。

## 功能

当然，此插件提供基于[OpenSSH][openssh]的SSH服务器以及基于Web的终端（也可以包含在您的Home Assistant前端）。此外，它开箱即用提供以下功能：

- 直接从Home Assistant前端访问命令行！
- 安全的SSH默认配置：
  - 只允许该配置用户登录，即使创建了更多用户。
  - 仅使用已知的安全密码和算法。
  - 限制登录尝试，以更好地防止暴力破解攻击。
  - 还有许多其他安全调整，_此插件在所有[ssh-audit]检查中没有警告！_
    ![SSH-Audit结果][ssh-audit-image]
- 配备SSH兼容模式选项，允许旧客户端连接。
- 支持Mosh，允许漫游并支持间歇性连接。
- 默认情况下禁用SFTP支持，但可由用户配置。
- 如果通过通用Linux安装程序安装了Home Assistant，则兼容。
- 用户名可配置，因此不再强制使用`root`。
- 在插件重启之间保留自定义SSH客户端设置和密钥。
- 日志级别允许您更轻松地诊断问题。
- 对您的音频、UART/串行设备和GPIO引脚的硬件访问。
- 以更高的权限运行，允许您调试和测试更多情况。
- 访问主机系统的dbus。
- 有访问在主机系统上运行的Docker实例的选项。
- 在主机级网络上运行，允许您打开端口或运行小守护程序。
- 启动时安装自定义Alpine包。这允许您安装您最喜欢的工具，每次登录时都可用。
- 在插件启动时执行自定义命令，以便您可以按您的喜好自定义Shell。
- 以[ZSH][zsh]作为默认Shell。对初学者更易使用，对经验丰富的用户更高级。它甚至预装了["Oh My ZSH"][ohmyzsh]，并启用了一些插件。
- 提供一套合理的工具，开箱即用：curl、Wget、RSync、GIT、Nmap、Mosquitto客户端、MariaDB/MySQL客户端、Awake（“局域网唤醒”）、Nano、Vim、tmux和一堆常用的网络工具。

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