# Home Assistant 插件: emby

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Femby%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Femby%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Femby%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我仓库加星的人！点击下面的图片来加星，然后它会在右上角。谢谢！_

[![Starters repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/emby/stats.png)

## 关于

[emby](https://emby.media/) 组织来自个人媒体库的视频、音乐、直播电视和照片，并将它们流式传输到智能电视、流媒体盒和移动设备。此容器打包为独立的 emby 媒体服务器。

此插件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-emby)。
初始插件版本 : https://github.com/petersendev/hassio-addons

## 配置

Webui 可以在 `<your-ip>:8096` 找到，或通过 Ingress 在 Home Assistant 中找到。

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 # 将要挂载的驱动器的硬件名称用逗号分隔，或其标签。如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，对所有 smb 分享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 分享设置域
silent: true # 抑制调试消息
```

## 安装

这个插件的安装相当简单，并与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件仓库添加到你的 Hass.io 实例][repository]。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切顺利。
1. 小心配置插件以满足你的需求，具体请参见官方文档。

[repository]: https://github.com/alexbelgium/hassio-addons