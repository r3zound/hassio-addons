## &#9888; 打开问题 : [🐛 [navidrome] 启动时使用默认设置导致崩溃 (打开于 2025-02-03)](https://github.com/alexbelgium/hassio-addons/issues/1751) 由 [@feamsr00](https://github.com/feamsr00)
# Home Assistant 插件: Navidrome

[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)
[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%navidrome%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%navidrome%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%navidrome%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20Paypal-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white

_感谢所有给我的库点星的人！要点星，请点击下面的图像，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载进化](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/navidrome/stats.png)

## 关于

各种调整和配置选项的添加。
此插件基于 [docker 镜像](https://hub.docker.com/r/deluan/navidrome)。

## 配置

请参见 https://www.navidrome.org/docs/usage/configuration-options/#available-options

```yaml
    "base_url": "localhost",         # 配置 Navidrome 在代理后面的基础 URL
    "music_folder": "/data/music",   # 存储音乐库的文件夹。可以是只读
    "data_folder": "/data/data",     # 存储应用数据（数据库）的文件夹
    "log_level": "info",             # 日志级别。用于故障排除。可能的值：error, warn, info, debug, trace
    "certfile": "fullchain.pem",     # TLS 证书的路径
    "keyfile": "privkey.pem",        # TLS 密钥文件的路径
    "ssl": false                     # 应用是否应使用 https
```

Webui 可以在 `<你的-ip>:端口` 找到。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志，查看一切是否顺利。
1. 转到 webui，在那里你将初始化应用程序。
1. 重启插件，以应用任何应该应用的选项。

[repository]: https://github.com/alexbelgium/hassio-addons