# Home Assistant 插件：Portainer

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

从以下项目分叉 : https://github.com/hassio-addons/addon-portainer
实施更改 : 更新到最新版本；Ingress；SSL；通过插件选项设置密码；允许手动覆盖

_感谢所有给我的仓库加星的人！要给它加星，请点击下面的图像，然后它会显示在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载趋势](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/portainer/stats.png)

## 关于

---

Portainer是一个开源的轻量级管理用户界面，允许你
轻松管理你的Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了Docker的详细
概览，并允许你管理容器、镜像、网络和
卷。

## 还原备份

打开插件选项并将密码设置为“空”。重启插件，将允许从备份还原Portainer。你需要将备份放在可访问的文件夹中，例如 /share，以便在插件中挂载。

## 警告

Portainer插件功能强大，几乎可以访问
你的整个系统。虽然这个插件是经过谨慎创建和维护的，并考虑到安全性，但在错误或缺乏经验的手中，
可能会损坏你的系统。

## 安装

---

安装此插件相当简单，和安装其他插件没有区别。

1. 将我的插件库添加到你的Home Assistant实例（在Supervisor插件商店右上角，或者如果你已配置我的HA，请点击下面的按钮）
   [![打开你的Home Assistant实例，并显示添加插件库对话框，特定的仓库URL预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮来存储你的配置。
1. 根据你的偏好设置插件选项
1. 启动插件。
1. 检查插件的日志，以查看一切是否正常。
1. 打开WebUI并调整软件选项。

## 配置

---

WebUI可以在 <http://homeassistant:port> 找到，或在侧边栏中使用Ingress。
默认用户名/密码：在启动日志中描述。
配置可以通过应用的WebUI进行，除了以下选项

```yaml
ssl: true/false
certfile: fullchain.pem #ssl证书，必须位于/ssl目录
keyfile: privkey.pem #ssl密钥文件，必须位于/ssl目录
password: 定义管理员密码。如果保持空白，将允许手动恢复以前的备份。至少12个字符。
```

## 支持

在GitHub上创建一个问题

## 插图

---

![插图](https://github.com/hassio-addons/addon-portainer/raw/main/images/screenshot.png)