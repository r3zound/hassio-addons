# Home Assistant 附加组件：Cloudflared

[![GitHub Release][releases-shield]][releases]
![项目阶段][project-stage-shield]
![项目维护][maintenance-shield]
![报告的安装数量][installations-shield-stable]

使用 Cloudflared 无需打开任何端口即可远程连接到您的 Home Assistant 实例。

## 关于

Cloudflared 通过安全隧道将您的 Home Assistant 实例连接到 Cloudflare 的域或子域。这样，您可以在不打开路由器端口的情况下将 Home Assistant 暴露于互联网。此外，您还可以利用 Cloudflare Teams 及其零信任平台进一步保护您的 Home Assistant 连接。

**要使用此附加组件，您必须拥有一个使用 Cloudflare 作为 DNS 记录的域名（例如 example.com）。您可以在我们的 [Wiki][wiki] 中找到更多相关信息**。

## 免责声明

使用此附加组件时，请确保遵守 [Cloudflare 自助订阅协议][cloudflare-sssa]。

[cloudflare-sssa]: https://www.cloudflare.com/terms/
[domainarticle]: https://www.linkedin.com/pulse/what-do-domain-name-how-get-one-free-tobias-brenner?trk=public_post-content_share-article
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[releases-shield]: https://img.shields.io/github/v/release/brenner-tobias/addon-cloudflared?include_prereleases
[releases]: https://github.com/brenner-tobias/addon-cloudflared/releases
[wiki]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos
[installations-shield-edge]: https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fanalytics.home-assistant.io%2Faddons.json&query=%24%5B%22ffd6a162_cloudflared%22%5D.total&label=Reported%20Installations&link=https%3A%2F%2Fanalytics.home-assistant.io/add-ons
[installations-shield-stable]: https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fanalytics.home-assistant.io%2Faddons.json&query=%24%5B%229074a9fa_cloudflared%22%5D.total&label=Reported%20Installations&link=https%3A%2F%2Fanalytics.home-assistant.io/add-ons