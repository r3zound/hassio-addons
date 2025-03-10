# 家庭助理插件：overseerr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点星的人！想要点星的话点击下面的图片，它会显示在右上角。谢谢！_

[![为 @alexbelgium/hassio-addons 点星的用户列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/overseerr/stats.png)

## 关于

---

[Overseerr](https://overseerr.dev/) 是一个请求管理和媒体发现工具，旨在与您现有的 Plex 生态系统配合使用。
这个插件基于 docker 镜像 https://github.com/linuxserver/docker-overseerr

## 安装

---

这个插件的安装非常简单，与安装其他任何插件没有不同。

1. 将我的插件仓库添加到您的家庭助理实例中（在主管插件商店右上角，或如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的家庭助理实例并显示添加插件仓库对话框，特定仓库 URL 已预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装该插件。
1. 点击`保存`按钮以存储您的配置。
1. 设置插件选项以符合您的喜好。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开 webUI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
配置可以通过应用的 webUI 完成，除了以下选项

```yaml
PGID: user
GPID: user
TZ: timezone
```

## 支持

在 github 上创建一个问题。

## 插图

---

![插图](https://overseerr.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons