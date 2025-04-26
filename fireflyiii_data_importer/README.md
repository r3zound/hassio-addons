# Home assistant 插件: Fireflyiii 数据导入器

[![捐款][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐款][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii_data_importer%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii_data_importer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ffireflyiii_data_importer%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码%20检查)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20给我买杯%20咖啡%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20给我买杯%20咖啡%20通过%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的朋友们！要加星，请点击下面的图像，然后在右上角会显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库名册](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/fireflyiii_data_importer/stats.png)

## 关于

["Firefly III"](https://www.firefly-iii.org) 是一个（自托管）个人财务管理工具。它可以帮助您跟踪开支和收入，从而节省更多。数据导入器旨在帮助您将交易导入 Firefly III。出于安全和维护原因，它与 Firefly III 分开。

此插件基于 Docker 镜像 https://hub.docker.com/r/fireflyiii/data-importer

## 配置

请阅读官方文档以获取有关如何设置变量的信息：https://docs.firefly-iii.org/data-importer。

可以根据：https://docs.firefly-iii.org/data-importer/help/config/ 在 /addon_configs/xxx-fireflyiii_data_importer/configurations 文件夹中添加配置。

可以通过添加文件到 /addon_configs/xxx-fireflyiii_data_importer/import_files 来进行自动导入，具体请参见：https://docs.firefly-iii.org/data-importer/usage/command_line/

选项可以通过两种方式配置：

- 插件选项

```yaml
"CONFIG_LOCATION": config.yaml 的位置 # 设置 config.yaml 的位置（见下文）
"FIREFLY_III_ACCESS_TOKEN": 访问 Firefly 所需
"FIREFLY_III_CLIENT_ID": 访问 Firefly 的备用方式
"FIREFLY_III_URL": 您的 URL，可以是本地（Docker IP），也可以是外部（公共 IP）
"NORDIGEN_ID": 您的 Nordigen 客户端 ID
"NORDIGEN_KEY": 您的 Nordigen 客户端密钥
"SPECTRE_APP_ID": 您的 Spectre / Salt Edge 客户端 ID
"SPECTRE_SECRET": 您的 Spectre / Salt Edge 客户端密钥
"Updates": hourly|daily|weekly # 设置在 /config/addons_config/fireflyiii_data_importer/import_files 中设置的自动上传文件
"silent": true # 抑制调试消息
```

- Config.yaml（高级用法）

额外的变量可以通过在插件选项中定义的位置的 config.yaml 中添加来作为 ENV 变量设置，具体请参见此指南：https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

完整的 ENV 变量列表可以在这里查看：https://github.com/firefly-iii/data-importer/blob/main/.env.example

## 安装

安装此插件非常简单，与安装其他任何插件并无不同。

1. 将我的插件库添加到您的家庭助理实例中（在监督附加组件商店右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的家庭助理实例并显示添加附加组件库对话框，预填特定库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 根据您的偏好设置附加组件选项
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 并调整软件选项

## 支持

在 GitHub 上创建一个问题

## 插图

[repository]: https://github.com/alexbelgium/hassio-addons