# Home Assistant社区插件：高级SSH与Web终端

[![发布][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![Discord][discord-shield]][discord] [![社区论坛][forum-shield]][forum]

[![通过GitHub赞助支持Frenck][github-sponsors-shield]][github-sponsors]

[![在Patreon支持Frenck][patreon-shield]][patreon]

此插件允许您使用SSH或Web终端登录到您的Home Assistant实例。

## 关于

此插件允许您使用SSH或Web终端登录到您的Home Assistant实例，访问您的文件夹，并且还包括一个命令行工具，可以执行重启、更新和检查实例等操作。

这是提供的[Home Assistant SSH插件][hass-ssh]的增强版本，专注于安全性、可用性、灵活性，并通过Web界面提供访问。

![Home Assistant前端中的Web终端][screenshot]

## 警告

高级SSH与Web终端插件非常强大，几乎为您提供访问系统所有工具和几乎所有硬件的权限。

虽然这个插件是以安全为中心和小心创建和维护的，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 特性

此插件当然提供一个基于[OpenSSH][openssh]的SSH服务器以及一个基于Web的终端（可以包含在您的Home Assistant前端中）。此外，它开箱即用带有以下功能：

- 直接从Home Assistant前端访问命令行！
- 安全的SSH默认配置：
  - 仅允许配置的用户登录，即使创建了更多用户。
  - 仅使用已知的安全密码和算法。
  - 限制登录尝试以更好地防止暴力攻击。
  - 许多其他安全微调，_此插件通过了所有[ssh-audit]检查而没有警告！_
    ![SSH审计结果][ssh-audit-image]
- 提供SSH兼容模式选项，以允许旧客户端连接。
- 支持Mosh，允许漫游并支持间歇性连接。
- 默认禁用SFTP支持，但可以由用户配置。
- 兼容通过通用Linux安装程序安装的Home Assistant。
- 用户名是可配置的，因此`root`不再是强制性的。
- 在插件重启之间保留自定义SSH客户端设置和密钥。
- 允许您更轻松地排查问题的日志级别。
- 硬件访问您的音频、串行设备和GPIO引脚。
- 拥有更高的权限，让您能够调试和测试更多情况。
- 访问主机系统的dbus。
- 可以访问主机系统上运行的Docker实例。
- 在主机级别网络上运行，允许您打开端口或运行小守护进程。
- 启动时安装自定义Alpine包。这样您可以安装您喜欢的工具，每次登录时都会可用。
- 在插件启动时执行自定义命令，以便您能够根据自己的喜好自定义shell。
- 将[ZSH][zsh]作为其默认shell。对初学者更容易使用，对更有经验的用户更高级。它甚至预装了["Oh My ZSH"][ohmyzsh]，并启用了一些插件。
- 开箱即用包含一组合理的工具：curl、Wget、RSync、GIT、Nmap、Mosquitto客户端、MariaDB/MySQL客户端、Awake（“唤醒局域网”）、Nano、Vim、tmux和一系列常用的网络工具。

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