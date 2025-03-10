# Home Assistant 社区插件: Tor

[![发布][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![在 Discord 上联系][discord-shield]][discord] [![社区论坛][forum-shield]][forum]

[![通过 GitHub Sponsors 支持 Frenck][github-sponsors-shield]][github-sponsors]

[![在 Patreon 上支持 Frenck][patreon-shield]][patreon]

保护您的隐私，通过 Tor 访问 Home Assistant。

## 关于

这个 Tor 插件允许您将 Home Assistant 实例作为 Onion 网站进行访问，
通过 [Tor 的隐形服务][tor-hidden-service] 特性。启用此功能后，
您无需打开防火墙端口或设置 HTTPS 以启用安全的远程访问。

如果您希望：

- 在不打开防火墙端口或设置 VPN 的情况下，远程访问您的 Home Assistant 实例。
- 不想或不知道如何获取 SSL/TLS 证书和 HTTPS 配置。
- 阻止攻击者能够访问/扫描您的端口和服务器。
- 阻止任何人知道您的家庭 IP 地址以及看到您与 Home Assistant 的流量。

该插件还提供了将Sock代理打开到
Tor 网络的可能性。允许您通过您的 Home Assistant 安装从任何支持 (SOCKS) 的应用程序访问 Tor。

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