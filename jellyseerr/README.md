# 家庭助理插件：jellyseerr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢大家为我的仓库点赞！要点赞请点击下面的图片，然后会显示在右上角。谢谢！_

[![点赞者名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/jellyseerr/stats.png)

## 关于

---

[Jellyseerr](https://hub.docker.com/r/fallenbagel/jellyseerr) 是一个请求管理和媒体发现工具，旨在与您现有的 Plex 生态系统配合使用。  
该插件基于 Docker 镜像 [https://github.com/linuxserver/docker-jellyseerr](https://github.com/Fallenbagel/jellyseerr)

## 安装

---

此插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的家庭助手实例（在监督器插件商店右上角，或者如果您已配置我的 HA，请单击下面的按钮）  
   [![打开您的家庭助手实例并显示添加插件库对话框，预填特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以保存您的配置。
4. 根据您的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 WebUI 并调整软件选项。

## 配置

---

Webui 可在 <http://homeassistant:PORT> 找到。  
默认用户名/密码：在启动日志中描述。  
可以通过应用的 WebUI 进行配置，除了以下选项：

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://jellyseerr.com/img/slider/artistdetails.png)

[仓库]: https://github.com/alexbelgium/hassio-addons