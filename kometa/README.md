<!-- markdownlint-disable MD043 -->

# 家庭助理插件：Kometa

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的库点星的人！要给我库点星，请点击下面的图片，然后它将在右上角。谢谢！_

[![Star人数统计](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载趋势](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/kometa/stats.png)

## 关于

---

[Kometa](https://kometa.wiki/en/latest/) 是一个 Python 3 脚本，可以使用 YAML 配置文件持续运行，根据计划更新库中电影、节目和收藏的元数据，并自动基于各种方法构建收藏，所有这些方法在 wiki 中都有详细说明。

此插件基于 Docker 镜像 <https://github.com/linuxserver/docker-kometa>

## 安装

---

该插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的家庭助理实例（在监督者插件商店右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填特定库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件日志以查看一切是否正常。
7. 打开 webUI 并调整软件选项。

## 配置

可以参考 [这份指南](https://github.com/Kometa-Team/Kometa#setting-up-the-initial-config-file) 帮助您设置并顺利运行。
更多信息请查看 [官方 wiki](https://github.com/Kometa-Team/Kometa)。

选项可以通过两种方式配置：

- 插件选项

```yaml
PUID: 1000 # 用户ID - 下面有解释
PGID: 1000 # 组ID - 下面有解释
TZ: Europe/London # 指定使用的时区，例如 Europe/London。
KOMETA_CONFIG: /config/addons_config/kometa/config/config.yml # 指定要使用的自定义配置文件。
KOMETA_TIME: 03:00 # 每天更新的时间列表，以逗号分隔。格式：HH:MM。
KOMETA_RUN: False # 设置为 True 以不使用调度程序运行。
KOMETA_TEST: False # 设置为 True 以在只包含测试的集合中运行调试模式。
KOMETA_NO_MISSING: False # 设置为 True 以运行，而不执行任何缺失电影/节目的功能。
```

- Config.yaml（高级用法）

可以通过在 config.yaml 中添加它们作为 ENV 变量，在根据本指南定义的插件选项位置添加它们： <https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables>

ENV 变量的完整列表可以在这里查看： <https://kometa.wiki/en/latest/kometa/environmental/>

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://dausruddin.com/wp-content/uploads/2020/05/plex-meta-manager-v3-1024x515.png)