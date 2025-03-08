## &#9888; 打开问题 : [🐛 [Jellyseerr] Jellyseerr由于nvme权限问题无法保持运行（已打开2025-01-07）](https://github.com/alexbelgium/hassio-addons/issues/1701) by [@PetitSphincter](https://github.com/PetitSphincter)
# 家庭助理附加组件: jellyseerr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Foverseerr%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![给@alexbelgium/hassio-addons的星星统计](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/jellyseerr/stats.png)

## 关于

---

[Jellyseerr](https://hub.docker.com/r/fallenbagel/jellyseerr) 是一个请求管理和媒体发现工具，旨在与您现有的Plex生态系统一起使用。  
此附加组件基于Docker镜像 [https://github.com/linuxserver/docker-jellyseerr](https://github.com/Fallenbagel/jellyseerr)

## 安装

---

此附加组件的安装非常简单，与安装任何其他附加组件并无不同。

1. 将我的附加组件库添加到您的家庭助理实例中（在监视器附加组件商店右上方，或如果您已配置我的HA，请点击下面的按钮）
   [![打开您的家庭助理实例并显示添加附加组件库对话框，预填特定的库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击`保存`按钮以保存您的配置。
4. 将附加组件选项设置为您所需的。
5. 启动附加组件。
6. 检查附加组件的日志，以查看一切是否正常。
7. 打开WebUI并调整软件选项。

## 配置

---

Webui可以在 <http://homeassistant:PORT> 找到。  
默认用户名/密码：在启动日志中描述。  
配置可以通过应用的WebUI完成，除了以下选项：

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
```

## 支持

在GitHub上创建一个问题。

## 插图

---

![插图](https://jellyseerr.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons