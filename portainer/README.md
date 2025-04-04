# Home Assistant 插件：Portainer

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

来自于 : https://github.com/hassio-addons/addon-portainer
实施更改 : 更新到最新版本；ingress；ssl；通过插件选项设置密码；允许手动覆盖

_感谢每一个给我仓库加星的人！要给我仓库加星，请点击以下图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer 是一个开源轻量级管理UI，允许您轻松管理您的Docker主机或Docker Swarm集群。

管理Docker从未如此简单。Portainer提供了一个详细的Docker概述，让您能够管理容器、镜像、网络和卷。

## 恢复备份

打开插件选项并将密码设置为“空”。重新启动插件，它将允许您从备份中恢复Portainer。您需要将备份放在一个可访问的文件夹中，例如/share，以便在插件中挂载。

## 警告

Portainer插件功能强大，几乎可以让您访问整个系统。虽然这个插件是经过仔细创建和维护的，并考虑到安全性，但在错误或缺乏经验的人手中，它可能会损坏您的系统。

## 安装

---

安装此插件相对简单，与安装任何其他插件没有区别。

1. 将我的插件仓库添加到您的Home Assistant实例中（在监督者插件商店右上角，或者如果您已经配置了我的HA，请点击下面的按钮）
   [![打开您的Home Assistant实例并显示添加插件仓库对话框，带有预填充的特定仓库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击`保存`按钮以存储您的配置。
4. 根据您的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志，查看一切是否顺利。
7. 打开webUI并调整软件选项。

## 配置

---

Webui可以在<http://homeassistant:port>找到，或者在您的侧边栏中使用Ingress。
默认用户名/密码：在启动日志中描述。
可以通过应用webUI进行配置，除了以下选项：

```yaml
ssl: true/false
certfile: fullchain.pem #ssl证书，必须位于/ssl
keyfile: privkey.pem #ssl密钥文件，必须位于/ssl
password: 定义管理员密码。如果留空，将允许手动恢复以前的备份。至少12个字符。
```

## 支持

在github上创建问题

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)