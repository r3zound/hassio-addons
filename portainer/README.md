# 家庭助手插件: Portainer

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建程序](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

从以下地址分叉 : https://github.com/hassio-addons/addon-portainer
已实施的变更 : 更新到最新版本；入口；ssl；通过插件选项设置密码；允许手动覆盖

_感谢所有为我的仓库点赞的人！要点赞，请点击下面的图片，然后它会在右上角显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer 是一个开源的轻量级管理 UI，允许您
轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了详细的
Docker 概述，并允许您管理容器、镜像、网络和
卷。

## 还原备份

打开插件选项并将密码设置为“空”。重新启动插件，它将允许从备份中还原 portainer。您需要将备份放在可访问的文件夹中，例如 /share，以便在插件中挂载

## 警告

Portainer 插件非常强大，可以让您几乎访问
整个系统。虽然这个插件是在考虑安全性的情况下创建和维护的，但在错误或缺乏经验的手中，
它可能会损坏您的系统。

## 安装

---

此插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件仓库添加到您的家庭助手实例中（在监控器插件商店右上角，或如果您已配置我的 HA，则点击下面的按钮）
   [![打开您的 Home Assistant 实例并展示添加插件仓库对话框，预填特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据偏好设置设置插件选项。
5. 启动插件。
6. 检查插件的日志，以查看一切是否顺利。
7. 打开 WebUI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:port> 找到，或在您的侧边欄中使用 Ingress。
默认用户名/密码：在启动日志中描述。
除了以下选项外，配置可以通过应用程序 WebUI 进行：

```yaml
ssl: true/false
certfile: fullchain.pem #ssl证书，必须位于 /ssl
keyfile: privkey.pem #ssl秘钥文件，必须位于 /ssl
password: 定义管理员密码。如果保持空白，将允许手动还原以前的备份。至少12个字符。
```

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)