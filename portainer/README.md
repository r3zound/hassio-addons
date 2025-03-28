# 家庭助理插件：Portainer

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=检查代码)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

分支自： https://github.com/hassio-addons/addon-portainer
实施的变更：更新到最新版本；入口；SSL；通过插件选项设置密码；允许手动覆盖

_感谢每一个给我的仓库加星的人！点击下面的图片给它加星，然后它将出现在右上角。谢谢！_

[![给@alexbelgium/hassio-addons的星标观察者列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载趋势](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer 是一个开源的轻量级管理UI，允许您轻松管理 Docker 主机或 Docker Swarm 群集。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 还原备份

打开插件选项并将密码设置为 "空"。重启插件，将允许从备份中还原 Portainer。您需要将备份放在可访问的文件夹中，例如 /share，以便在插件中挂载。

## 警告

Portainer 插件功能强大，几乎可以访问您整个系统。虽然该插件是精心创建和维护的，并考虑了安全问题，但在错误或缺乏经验的用户手中，可能会对您的系统造成损害。

## 安装

---

该插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的家庭助理实例中（在监督器插件商店右上角，或如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的家庭助理实例，并显示添加插件库对话框，预填特定库的 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 根据您的偏好设置插件选项。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 webUI 并调整软件选项。

## 配置

---

WebUI 可以在 <http://homeassistant:port> 找到，或者在您的侧边栏中使用入口访问。
默认用户名/密码：在启动日志中描述。
可以通过应用的 WebUI 进行配置，以下选项除外：

```yaml
ssl: true/false
certfile: fullchain.pem # ssl证书，必须位于 /ssl
keyfile: privkey.pem # ssl密钥文件，必须位于 /ssl
password: 定义管理员密码。如果保持为空，将允许手动恢复之前的备份。至少12个字符。
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)