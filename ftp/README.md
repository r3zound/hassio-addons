# Home Assistant 社区附加组件: FTP

[![Release][release-shield]][release] ![项目阶段][project-stage-shield] ![项目维护][maintenance-shield]

[![Discord][discord-shield]][discord] [![社区论坛][forum-shield]][forum]

[![通过 GitHub Sponsors 支持 Frenck][github-sponsors-shield]][github-sponsors]

[![在 Patreon 上支持 Frenck][patreon-shield]][patreon]

一个安全且快速的 Home Assistant FTP 服务器

## 关于

FTP 协议有时可能会派上用场。虽然它比较古老，但仍然有其用途。例如，大多数 IP 摄像头仍支持通过 FTP 上传图像或视频。

该附加组件以相对安全的方式为 Hass.io 提供 FTP 服务器。虽然 FTP 本质上并不完全安全（未加密），但此附加组件支持 FTP over SSL (FTPS) 并在其主目录中监禁（chroot）虚拟用户。

当然，如果你真的需要，也可以使用此附加组件再次通过 FTP 访问你的 Home Assistant 配置。

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-ftp/36799?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v5.2.1-blue.svg
[release]: https://github.com/hassio-addons/addon-ftp/tree/v5.2.1