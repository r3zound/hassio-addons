## &#9888; 打开问题 : [🐛 [navidrome] 启动时在默认设置下崩溃 (已开于 2025-02-03)](https://github.com/alexbelgium/hassio-addons/issues/1751) 由 [@feamsr00](https://github.com/feamsr00)
# 家庭助手附加组件: Navidrome

[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)
[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%navidrome%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%navidrome%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%navidrome%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20Paypal-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white

_感谢每一位给予我仓库星标的朋友！要给它星标，请点击下面的图片，然后在右上角会显示。谢谢！_

[![星标者名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/navidrome/stats.png)

## 关于

各种调整和配置选项的添加。
这个附加组件基于 [docker 镜像](https://hub.docker.com/r/deluan/navidrome)。

## 配置

请参见 https://www.navidrome.org/docs/usage/configuration-options/#available-options

```yaml
    "base_url": "localhost",         # 配置在代理后面的 Navidrome 的基本 URL
    "music_folder": "/data/music",   # 存储音乐库的文件夹。可以是只读的
    "data_folder": "/data/data",     # 存储应用数据（数据库）的文件夹
    "log_level": "info",             # 日志级别。对故障排除有用。可能的值：error, warn, info, debug, trace
    "certfile": "fullchain.pem",     # TLS 证书的路径
    "keyfile": "privkey.pem",        # TLS 密钥文件的路径
    "ssl": false                     # 应用是否应该使用 https
```

Webui 可以在 `<your-ip>:port` 找到。

## 安装

安装此附加组件相当简单，与安装任何其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看一切是否顺利。
1. 转到 webui，您将在那里初始化应用。
1. 重启附加组件，以应用任何应应用的选项。

[repository]: https://github.com/alexbelgium/hassio-addons