# Home Assistant 插件：Caddy Builder

这将为您构建一个自定义的 Caddy 二进制文件。

用于下载自定义 Caddy 二进制文件的网站 (https://caddyserver.com/download) 经常不可用或无法工作。此插件将运行 xcaddy 并构建一个具有您所需插件的自定义二进制文件。

使用 caddy2 homeassistant 插件运行此仓库中可用的自定义 Caddy 二进制文件： https://github.com/einschmidt/hassio-addons

有关 xcaddy 的使用信息可以在这里找到：https://github.com/caddyserver/xcaddy

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 caddy-builder [docker 镜像](https://hub.docker.com/_/caddy)。

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 关闭“开机启动”开关。
1. 点击 `Save` 按钮以存储您的配置。
1. 运行一次插件。它应该会失败，这没关系。
1. 从此仓库复制 [xcaddyCommand.sh](https://raw.githubusercontent.com/jdeath/homeassistant-addons/main/caddybuilder/xcaddyCommand.sh) 到 /addon_configs/XXXXXX_caddybuilder （XXXXX 是像 2effc9b9 这样的字符串，将在上一步中创建）。
1. 编辑 xcaddyCommand.sh 以包含您想要运行的 xcaddy 命令。确保所有命令在同一行上。查阅 xcaddy 文档以添加插件。
1. 运行插件。应该会在 /addon_configs/XXXXXX_caddybuilder/ 中构建一个自定义的 Caddy 二进制文件。
1. 可能需要一段时间，因此请刷新日志以查看是否构建正确。
1. 将 Caddy 二进制文件复制到 /share/caddy/。
1. 重启 [caddy2](https://github.com/einschmidt/hassio-addons) 插件（不是此插件），它应该使用您的新自定义 Caddy 二进制文件。

[repository]: https://github.com/jdeath/homeassistant-addons