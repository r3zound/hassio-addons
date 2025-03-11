# Home Assistant 社区附加组件：Tor

[![Release][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![Discord][discord-shield]][discord] [![社区论坛][forum-shield]][forum]

[![通过 GitHub Sponsors 赞助 Frenck][github-sponsors-shield]][github-sponsors]

[![在 Patreon 上支持 Frenck][patreon-shield]][patreon]

保护您的隐私，通过 Tor 访问 Home Assistant。

## 关于

此 Tor 附加组件允许您通过 [Tor 的隐藏服务][tor-hidden-service] 功能访问您的 Home Assistant 实例作为一个洋葱站点。启用此功能后，您无需打开防火墙端口或设置 HTTPS 即可实现安全远程访问。

这在以下情况下非常有用：

- 远程访问您的 Home Assistant 实例，而无需打开防火墙端口或设置 VPN。
- 不想或不知道如何获取 SSL/TLS 证书以及 HTTPS 配置。
- 希望阻止攻击者甚至可以访问/扫描您的端口和服务器。
- 希望阻止任何人知道您的家庭 IP 地址并查看您与 Home Assistant 的流量。

该附加组件还提供在 Tor 网络中打开 Sock 代理的可能性。允许您通过 Home Assistant 安装从任何支持 SOCKS 的应用程序访问 Tor。

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tor/33822?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v6.0.0-blue.svg
[release]: https://github.com/hassio-addons/addon-tor/tree/v6.0.0
[tor-hidden-service]: https://www.torproject.org/docs/hidden-services.html.en