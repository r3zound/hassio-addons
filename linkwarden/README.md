# Home assistant 插件：linkwarden

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flinkwarden%2Fconfig.json)
![接入](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flinkwarden%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flinkwarden%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有星标我的仓库的人！要星标它，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/linkwarden/stats.png)

## 关于

---

[linkwarden](https://linkwarden.app/) 是一个协作书签管理器，用于收集、组织和保存网页和文章。
此插件基于他们的 Docker 镜像。

## 配置

安装后首次启动插件
Webui 可以在 <http://homeassistant:3000> 找到。
您需要在启动时创建一个新用户。

选项可以通过两种方式进行配置：

- 插件选项

```yaml
"NEXTAUTH_SECRET": 必填，启动时必须填写
"NEXTAUTH_URL": 可选，仅当 linkwarden 保持外部时
"NEXT_PUBLIC_DISABLE_REGISTRATION": 如果设置为 true，将禁用注册。
"NEXT_PUBLIC_CREDENTIALS_ENABLED": 如果设置为 true，用户将能够使用用户名和密码登录。
"STORAGE_FOLDER": 可选，默认为 /config/library
"DATABASE_URL": 可选，如果保持空白，将使用内部数据库。如果使用外部数据库，请按照此设计修改 postgresql://postgres:homeassistant@localhost:5432/linkwarden
"NEXT_PUBLIC_AUTHENTIK_ENABLED": 如果设置为 true，将启用 Authentik，您需要定义以下变量。
"AUTHENTIK_CUSTOM_NAME": 可选设置自定义提供者名称。（按钮上的名称）
"AUTHENTIK_ISSUER": 这是在提供者概述中显示的 "OpenID 配置发行人"。请注意，您必须删除 URL 末尾的 "/"。应形如：`https://authentik.my-doma.in/application/o/linkwarden`
"AUTHENTIK_CLIENT_ID": 从 Authentik 中提供者概述屏幕复制的客户端 ID
"AUTHENTIK_CLIENT_SECRET": 从 Authentik 中提供者概述屏幕复制的客户端密钥
```

- Config.yaml
所有其他选项可以使用在 /config/db21ed7f_filebrowser/config.yaml 中找到的 config.yaml 文件进行配置，使用 Filebrowser 插件。

完整的选项列表可以在这里查看 : https://docs.linkwarden.app/self-hosting/environment-variables

## 安装

---

安装此插件非常简单，与安装任何其他插件没有不同。

1. 将我的插件库添加到您的家庭助手实例中（在监督插件商店的右上角，或者如果您已经配置了我的 HA，则点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示带有特定库 URL 的添加插件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 单击 `保存` 按钮以保存您的配置。
1. 根据您的偏好设置添加插件选项
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开 WebUI 并调整软件选项

## 与 Authentik 的集成

按照 Linkwarden 文档页面上的说明进行操作。 https://docs.linkwarden.app/self-hosting/sso-oauth#authentik

## 常见问题

<details>
 

## 支持

在 GitHub 上创建一个问题，或在 [家庭助手主题](https://community.home-assistant.io/t/home-assistant-addon-linkwarden/279247) 上询问

---

![插图](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/linkwarden/illustration.png)