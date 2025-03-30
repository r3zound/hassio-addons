# Home assistant 附加组件: Portainer

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码检验)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20给我%20买杯%20咖啡%20(不%20支持%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20给我%20买杯%20咖啡%20通过%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

源自: https://github.com/hassio-addons/addon-portainer
实现的变更: 更新到最新版本；入口；ssl；通过附加组件选项设置密码；允许手动覆盖

_感谢每一个为我的仓库点赞的人！点击下方图像为其点赞，然后它会出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer 是一个开源的轻量级管理用户界面，可以让您轻松管理您的 Docker 主机或 Docker swarm 集群。

管理 Docker 从未这么简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 恢复备份

打开附加组件选项，将密码设置为“空”。重启附加组件，它将允许从备份中恢复 Portainer。您需要将备份放入可以访问的文件夹，例如 /share，以便在附加组件中挂载。

## 警告

Portainer 附加组件非常强大，可以让您几乎访问整个系统。虽然此附加组件是在安全考虑下精心创建和维护的，但在错误或缺乏经验的手中，可能会对您的系统造成损害。

## 安装

---

安装此附加组件非常简单，与安装其他附加组件没有太大区别。

1. 将我的附加组件仓库添加到您的 Home Assistant 实例中（在监督器附加组件商店的右上角，或者如果您配置了我的 HA，请单击下方按钮）
   [![打开您的 Home Assistant 实例并显示添加附加组件仓库对话框，特定仓库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此附加组件。
1. 点击 `保存` 按钮以保存您的配置。
1. 根据您的偏好设置附加组件选项
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利。
1. 打开 webUI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:port> 找到，或在侧边栏中使用入口访问。
默认用户名/密码：在启动日志中描述。
可以通过应用 webUI 进行配置，但以下选项除外：

```yaml
ssl: true/false
certfile: fullchain.pem #ssl 证书，必须位于 /ssl
keyfile: privkey.pem #ssl 密钥文件，必须位于 /ssl
password: 定义管理员密码。如果保留为空，将允许手动恢复之前的备份。至少 12 个字符。
```

## 支持

在 GitHub 上创建问题

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)