## &#9888; 开放问题 : [🐛 [Firefly iii] 更新器拉取预发行版 (打开于2025-02-22)](https://github.com/alexbelgium/hassio-addons/issues/1783) 由 [@dreautall](https://github.com/dreautall)
# 家庭助理插件: fireflyiii

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20库)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/给我买杯咖啡%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/用Paypal给我买杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库点星的人！要点星，请点击下方的图片，然后在右上角会出现。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/fireflyiii/stats.png)

## 关于

["Firefly III"](https://www.firefly-iii.org) 是一个（自托管的）个人财务管理器。它可以帮助您跟踪支出和收入，从而减少开支，增加储蓄。
该插件基于docker镜像 https://hub.docker.com/r/fireflyiii/core

## 配置

请在首次启动前更改您的 APP_KEY！在没有重置数据库的情况下，您将无法再次更改。

选项可以通过两种方式配置：

- 插件选项

```yaml
"CONFIG_LOCATION": config.yaml 的位置 # 设置 config.yaml 的位置（见下文）
"DB_CONNECTION": "list(sqlite_internal|mariadb_addon|mysql|pgsql)" # 定义要使用的数据库类型：sqlite（默认，内嵌在插件中）；MariaDB（如果安装并运行MariaDB插件则自动检测），以及需要设置其他 DB_ 字段的外部数据库（mysql 和 pgsql）
"APP_KEY": 32个字符 # 这是您的加密密钥，请勿丢失！
"DB_HOST": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PORT": "CHANGEME" # 仅在使用远程数据库时需要
"DB_DATABASE": "CHANGEME" # 仅在使用远程数据库时需要
"DB_USERNAME": "CHANGEME" # 仅在使用远程数据库时需要
"DB_PASSWORD": "CHANGEME" # 仅在使用远程数据库时需要
"Updates": 每小时|每天|每周 # 设置自动更新
"silent": true # 如果为false，显示调试信息
```

- Config.yaml（高级用法）

可以通过在您插件选项定义的位置的config.yaml中添加环境变量来设置其他变量，按照本指南进行： https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

环境变量的完整列表可以在这里查看： https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/.env.example

## 安装

此插件的安装非常简单，与安装其他插件没有什么不同。

1. 将我的插件仓库添加到您的家庭助理实例中（在监督插件商店的右上方，或者在您已经配置我的HA时点击下面的按钮）
   [![打开您的家庭助手实例并显示添加插件仓库对话框，预填充特定仓库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以保存您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志，查看一切是否正常。
7. 打开WebUI并调整软件选项

## 支持

在GitHub上创建一个问题

## 插图

![插图](https://raw.githubusercontent.com/firefly-iii/firefly-iii/develop/.github/assets/img/imac-complete.png)

[repository]: https://github.com/alexbelgium/hassio-addons