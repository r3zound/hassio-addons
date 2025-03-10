# 家庭助手插件：Sonarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsonarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsonarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsonarr%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级代码检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有关注我的仓库的人！要关注，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![关注者列表 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/sonarr/stats.png)

## 关于

---

[Sonarr](https://sonarr.tv/) 是一个用于 Usenet 和 BitTorrent 用户的 PVR。它可以监控多个 RSS 源，以获取您喜欢的节目的新剧集，并会将其获取、分类和重命名。它还可以配置为在更高质量的文件格式可用时自动升级已下载文件的质量。
该插件基于 docker 镜像 https://github.com/linuxserver/docker-sonarr

## 安装

---

这个插件的安装相当简单，与安装任何其他插件没有区别。

1. 将我的插件仓库添加到您的家庭助手实例中（在右上角的主管插件商店中，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的家庭助手实例并显示添加插件仓库对话框，预填特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志，以查看是否一切正常。
7. 打开 Web 界面并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
默认的用户名/密码：在启动日志中描述。
除以下选项外，配置可以通过应用程序的 WebUI 完成。

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 请将要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔。
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同。
cifspassword: "password" # 可选，smb 密码。
connection_mode: ingress_noauth (默认，禁用身份验证以允许无缝的入口集成)，noingress_auth (禁用入口以允许更简单的外部 URL，启用身份验证)，ingress_auth (同时启用入口和身份验证)。
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://b0b.fr/wp-content/uploads/2016/02/Sonarr-1-1000x924.jpg)

[仓库]: https://github.com/alexbelgium/hassio-addons