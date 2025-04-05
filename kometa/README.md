<!-- markdownlint-disable MD043 -->

# 家庭助理插件：Kometa

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fplex_meta_manager%2Fconfig.json)

[![Codacy 勋章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码%20审核)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的代码库加星的人！要加星请点击下面的图片，然后在右上角即可。谢谢！_

[![为 @alexbelgium/hassio-addons 的星标用户库](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/kometa/stats.png)

## 关于

---

[Kometa](https://kometa.wiki/en/latest/) 是一个可以使用 YAML 配置文件持续运行的 Python 3 脚本，旨在按计划更新您库中电影、节目和集合的元数据，以及根据维基中详细描述的各种方法自动构建集合。

该插件基于docker镜像<https://github.com/linuxserver/docker-kometa>

## 安装

---

安装此插件非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的家庭助理实例中（在管理者插件商店右上方，或如果您已配置我的HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看是否一切顺利。
7. 打开Web界面并调整软件选项。

## 配置

有一个[入门指南](https://github.com/Kometa-Team/Kometa#setting-up-the-initial-config-file)可帮助您启动并运行。
有关更多信息，请参见[官方维基](https://github.com/Kometa-Team/Kometa)。

选项可以通过以下两种方式配置：

- 插件选项

```yaml
PUID: 1000 # 用户ID - 下面有说明
PGID: 1000 # 群组ID - 下面有说明
TZ: Europe/London # 指定用于EG Europe/London的时区。
KOMETA_CONFIG: /config/addons_config/kometa/config/config.yml # 指定要使用的自定义配置文件。
KOMETA_TIME: 03:00 # 每天更新的时间的逗号分隔列表。格式：HH:MM。
KOMETA_RUN: False # 设置为 True 以无调度程序运行。
KOMETA_TEST: False # 设置为 True 以调试模式运行，仅处理具有 test: true 的集合。
KOMETA_NO_MISSING: False # 设置为 True 以在没有任何缺失的电影/节目功能下运行。
```

- Config.yaml（高级用法）

可以通过在配置.yaml文件中根据本指南添加它们作为环境变量，位置为您插件选项中定义的位置：<https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables>

ENV 变量的完整列表可以在此查看：<https://kometa.wiki/en/latest/kometa/environmental/>

## 支持

在GitHub上创建一个问题。

## 插图

---

![插图](https://dausruddin.com/wp-content/uploads/2020/05/plex-meta-manager-v3-1024x515.png)