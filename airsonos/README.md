# Home Assistant Community Add-on: AirSonos

[![发布][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![通过 GitHub Sponsors 赞助 Frenck][github-sponsors-shield]][github-sponsors]

[![在 Patreon 上支持 Frenck][patreon-shield]][patreon]

为您的 Sonos（和 UPnP）播放器提供 AirPlay 功能。

## 关于

苹果设备使用 AirPlay 将音频发送到其他设备，但这与 Sonos 播放器不兼容。这个插件尝试解决这个不兼容的问题。

它会检测您网络中的 Sonos 播放器，并为每个播放器创建虚拟 AirPlay 设备。它充当 AirPlay 客户端和真实 Sonos 设备之间的桥梁。

由于 Sonos 使用 UPnP，该插件可能也适用于其他 UPnP 播放器（例如，较新的三星电视）。

AirCast 插件基于优秀的 [AirConnect][airconnect] 项目。

[airconnect]: https://github.com/philippe44/AirConnect
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-airsonos/36796?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v4.2.4-blue.svg
[release]: https://github.com/hassio-addons/addon-airsonos/tree/v4.2.4