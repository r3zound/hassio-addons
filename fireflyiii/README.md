## &#9888; 开放问题: [🐛 [FireflyIII] 无法更改语言 (已打开于 2025-03-23)](https://github.com/alexbelgium/hassio-addons/issues/1819) 由 [@FryggFR](https://github.com/FryggFR)
# 家庭助理附加组件: fireflyiii

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图片，然后它将在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标者仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/fireflyiii/stats.png)

## 关于

["Firefly III"](https://www.firefly-iii.org) 是一个（自托管的）个人财务管理工具。它可以帮助您跟踪支出和收入，从而让您花费更少，储蓄更多。
此附加组件基于 Docker 镜像 https://hub.docker.com/r/fireflyiii/core

## 配置

在首次启动之前请更改您的 APP_KEY！否则将无法在之后使用，除非重置数据库。

可以通过两种方式配置选项：

- 附加组件选项

```yaml
"CONFIG_LOCATION": 配置文件config.yaml的位置 # 设置config.yaml的位置（见下文）
"DB_CONNECTION": "list(sqlite_internal|mariadb_addon|mysql|pgsql)" # 定义使用的数据库类型：sqlite（默认，嵌入式在附加组件中）；MariaDB（如果安装并运行MariaDB附加组件，将自动检测），以及需要设置其他DB_字段的外部数据库（mysql和pgsql）
"APP_KEY": 32个字符 # 这是您的加密密钥，请不要丢失！
"DB_HOST": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PORT": "CHANGEME" # 仅在使用远程数据库时需要
"DB_DATABASE": "CHANGEME" # 仅在使用远程数据库时需要
"DB_USERNAME": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PASSWORD": "CHANGEME" # 仅在使用远程数据库时需要
"Updates": hourly|daily|weekly # 设置自动更新
"silent": true # 如果为false，显示调试信息
```

- Config.yaml（高级用法）

可以通过在附加组件选项定义的位置的config.yaml中添加环境变量，按此指南执行：https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

环境变量的完整列表可以在这里查看：https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/.env.example

## 安装

安装此附加组件非常简单，与安装其他任何附加组件没有区别。

1. 将我的附加组件库添加到您的家庭助理实例中（在监督员附加组件商店右上角，或者如果您已配置我的HA，单击下面的按钮）
   [![打开您的家庭助理实例并显示添加附加组件库对话框，填充特定库网址。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此附加组件。
1. 单击 `保存` 按钮以存储您的配置。
1. 根据您的偏好设置附加组件选项
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否正常。
1. 打开webUI并调整软件选项

## 支持

在GitHub上创建一个问题

## 插图

![插图](https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/imac-complete.png)

[repository]: https://github.com/alexbelgium/hassio-addons