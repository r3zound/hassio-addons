# 家庭助手插件：fireflyiii

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库点赞的人！要点赞请点击下面的图像，然后它将出现在右上角。谢谢！_

[![星标者名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/fireflyiii/stats.png)

## 关于

[“Firefly III”](https://www.firefly-iii.org) 是一个（自托管）个人财务管理器。它可以帮助您跟踪您的支出和收入，这样您就可以花费更少并节省更多。
此插件基于docker镜像 https://hub.docker.com/r/fireflyiii/core

## 配置

请在第一次启动之前更改您的 APP_KEY！否则，您将无法在重置数据库后再进行更改。

选项可以通过两种方式进行配置：

- 插件选项

```yaml
"CONFIG_LOCATION": config.yaml 的位置 # 设置 config.yaml 的位置（见下文）
"DB_CONNECTION": "list(sqlite_internal|mariadb_addon|mysql|pgsql)" # 定义要使用的数据库类型：sqlite（默认，嵌入在插件中）；MariaDB（如果安装并运行 MariaDB 插件则自动检测），以及需要设置其他 DB_ 字段的外部数据库（mysql 和 pgsql）
"APP_KEY": 32 个字符 # 这是您的加密密钥，请勿丢失！
"DB_HOST": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PORT": "CHANGEME" # 仅在使用远程数据库时需要
"DB_DATABASE": "CHANGEME" # 仅在使用远程数据库时需要
"DB_USERNAME": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PASSWORD": "CHANGEME" # 仅在使用远程数据库时需要
"Updates": hourly|daily|weekly # 设置自动更新
"silent": true # 如果为 false，则显示调试信息
```

- Config.yaml（高级用法）

可以通过将它们添加到您插件选项中定义的位置的 config.yaml 中作为 ENV 变量进行设置，具体请参见此指南：https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

ENV 变量的完整列表可以在此处查看：https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/.env.example

## 安装

安装此插件非常简单，与安装其他插件没有什么不同。

1. 将我的插件库添加到您的家庭助手实例中（在主管插件商店的右上角，或在您配置了我的 HA 后点击下面的按钮）
   [![打开您的家庭助手实例并显示添加插件库对话框，预填特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以保存您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看是否一切顺利。
7. 打开 webUI 并调整软件选项

## 支持

在 GitHub 上创建问题

## 插图

![插图](https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/imac-complete.png)

[repository]: https://github.com/alexbelgium/hassio-addons