# Home assistant 插件：Portainer

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

从以下地址派生： https://github.com/hassio-addons/addon-portainer
实现的更改：更新到最新版本；ingress；ssl；通过插件选项设置密码；允许手动覆盖

_感谢每一个给我的仓库点赞的人！要点赞，请点击下面的图像，然后它将位于右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载统计](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer 是一个开源的轻量级管理用户界面，允许您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 恢复备份

打开插件选项并将密码设置为“空”。重启插件，它将允许从备份恢复 Portainer。您需要将备份放入可访问的文件夹，例如 /share，以便在插件中挂载。

## 警告

Portainer 插件非常强大，几乎可以访问您的整个系统。尽管该插件是在安全的前提下仔细创建和维护的，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 安装

---

该插件的安装相当简单，与安装其他任何插件并无不同。

1. 将我的插件库添加到您的 Home Assistant 实例中（在监督器插件商店的右上角，或者如果您已经配置了我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储配置。
4. 根据您的喜好设置插件选项。
5. 启动插件。
6. 查看插件的日志以确认一切正常。
7. 打开 WebUI，并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:port> 找到，或者通过侧边栏使用 Ingress。
默认的用户名/密码：在启动日志中描述。
配置可以通过应用程序 WebUI 进行，除了以下选项

```yaml
ssl: true/false
certfile: fullchain.pem #ssl 证书，必须位于 /ssl 中
keyfile: privkey.pem #ssl 证书密钥文件，必须位于 /ssl 中
password: 定义管理员密码。如果保留为空，将允许手动还原以前的备份。至少 12 个字符。
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)