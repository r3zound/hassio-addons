## &#9888; 开放问题 : [🐛 [FireflyIII] 无法更改语言 (创建于2025-03-23)](https://github.com/alexbelgium/hassio-addons/issues/1819) by [@FryggFR](https://github.com/FryggFR)
# Home Assistant 附加组件: fireflyiii

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有点赞我仓库的人！要点赞，请点击下面的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/fireflyiii/stats.png)

## 关于

["Firefly III"](https://www.firefly-iii.org)是一个（自托管）个人财务管理器。它可以帮助您跟踪支出和收入，从而节省更多开支并节约更多。
该附加组件基于docker镜像 https://hub.docker.com/r/fireflyiii/core

## 配置

请在首次启动之前更改您的 APP_KEY！否则之后您将无法进行更改，必须重置数据库。

选项可以通过两种方式进行配置：

- 附加组件选项

```yaml
"CONFIG_LOCATION": config.yaml 的位置 # 设置 config.yaml 的位置（见下文）
"DB_CONNECTION": "list(sqlite_internal|mariadb_addon|mysql|pgsql)" # 定义要使用的数据库类型：sqlite（默认，嵌入在附加组件中）；MariaDB（如果安装并运行了 MariaDB 附加组件会自动检测），以及需要设置其他 DB_ 字段的外部数据库（mysql 和 pgsql）
"APP_KEY": 32个字符 # 这是您的加密密钥，请妥善保管！
"DB_HOST": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PORT": "CHANGEME" # 仅在使用远程数据库时需要
"DB_DATABASE": "CHANGEME" # 仅在使用远程数据库时需要
"DB_USERNAME": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PASSWORD": "CHANGEME" # 仅在使用远程数据库时需要
"Updates": hourly|daily|weekly # 设置自动更新
"silent": true # 如果为 false，则显示调试信息
```

- Config.yaml（高级用法）

可以通过在附加组件选项中定义的位置的 config.yaml 中添加这些变量，作为 ENV 变量进行设置，具体请参考本指南： https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

完整的 ENV 变量列表可见于： https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/.env.example

## 安装

安装此附加组件非常简单，与安装任何其他附加组件没有区别。

1. 将我的附加组件库添加到您的 Home Assistant 实例（在超级用户附加组件商店右上角，或如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加附加组件库对话框，预填充特定库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 单击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志，以查看一切是否正常。
7. 打开 webUI 并调整软件选项

## 支持

在 GitHub 上创建一个问题

## 插图

![插图](https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/imac-complete.png)

[repository]: https://github.com/alexbelgium/hassio-addons