# ⚠️ 推荐使用 Kometa 插件 (<https://github.com/alexbelgium/hassio-addons>) 而不是这个。 ⚠️

# Home Assistant 插件：Plex-meta-manager

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点赞的人！点击下面的图片就可以点赞，然后它会出现在右上角。谢谢！_

[![星标我的仓库的用户列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/plex_meta_manager/stats.png)

## 关于

---

[Plex-meta-manager](https://plex-meta-manager.video/) 是一个 Python 3 脚本，可以使用 YAML 配置文件不断运行，以按计划更新您库中电影、节目和集合的元数据，并自动基于各种方法构建集合，所有这些在 wiki 中都有详细介绍。

此插件基于 docker 镜像 https://github.com/linuxserver/docker-plex-meta-manager

## 安装

---

这个插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例中（在 supervisor 插件商店的右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以保存您的配置。
1. 根据您的偏好设置插件选项
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 webUI 并调整软件选项

## 配置

可以参考 [演练](https://github.com/meisnate12/Plex-Meta-Manager/wiki/Docker-Walkthrough#setting-up-the-initial-config-file) 来帮助您快速入门。
有关更多信息，请参见 [官方 wiki](https://github.com/meisnate12/Plex-Meta-Manager/wiki)。

选项可以通过两种方式进行配置：

- 插件选项

```yaml
PUID: 1000 #用户ID - 详细说明见下文
PGID: 1000 #组ID - 详细说明见下文
TZ: Europe/London #指定要使用的时区，例如 Europe/London。
PMM_CONFIG: /config/addons_config/plex-data-manager/config/config.yml #指定要使用的自定义配置文件。
PMM_TIME: 03:00 #每天更新的时间，以逗号分隔。格式：HH:MM。
PMM_RUN: False #设置为 True 以在没有计划程序的情况下运行。
PMM_TEST: False #设置为 True 以调试模式运行，仅运行 test: true 的集合。
PMM_NO_MISSING: False #设置为 True 以运行时不执行任何丢失的电影/节目功能。
```

- config.yaml（高级用法）

可以通过在 config.yaml 中的配置位置设置额外的变量作为 ENV 变量，具体参考此指南：https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

完整的 ENV 变量列表可以在这里查看：https://github.com/meisnate12/Plex-Meta-Manager/wiki/Run-Commands-&-Environmental-Variables

## 支持

在 GitHub 上创建问题

## 插图

---

![插图](https://dausruddin.com/wp-content/uploads/2020/05/plex-meta-manager-v3-1024x515.png)