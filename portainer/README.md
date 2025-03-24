# 家庭助手附加组件：Portainer

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

派生自 : https://github.com/hassio-addons/addon-portainer
已实现的更改 : 更新到最新版本；入口；SSL；通过附加选项设置密码；允许手动覆盖

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer 是一个开源轻量级管理 UI，允许您
轻松管理 Docker 主机或 Docker 垃圾桶集群。

管理 Docker 从未如此简单。Portainer 提供了详细的
Docker 概述，并允许您管理容器、镜像、网络和
卷。

## 还原备份

打开附加选项，将密码设置为“空”。重新启动附加组件，它将允许从备份还原 Portainer。您需要将备份放在可访问的文件夹中，例如 /share，以便在附加组件中挂载它。

## 警告

Portainer 附加组件非常强大，可以让您几乎可以访问
您的整个系统。虽然此附加组件是小心创建和维护的，并考虑安全性，但在错误或缺乏经验的手中，
可能会损坏您的系统。

## 安装

---

安装此附加组件非常简单，和安装其他任何附加组件没有区别。

1. 将我的附加库添加到您的家庭助手实例中（在主管附件商店的右上角，或者如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的家庭助手实例并显示带有特定存储库 URL 预填充的添加附加组件存储库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 单击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志以查看是否一切顺利。
7. 打开 WebUI 并调整软件选项

## 配置

---

Webui 可以在 <http://homeassistant:port> 找到，或在您的侧边栏中使用入口。
默认用户名/密码：在启动日志中描述。
可以通过应用 WebUI 进行配置，但以下选项除外

```yaml
ssl: true/false
certfile: fullchain.pem #ssl证书，必须位于 /ssl
keyfile: privkey.pem #ssl私钥文件，必须位于 /ssl
password: 定义管理员密码。如果保持为空，将允许手动还原之前的备份。至少 12 个字符。
```

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)