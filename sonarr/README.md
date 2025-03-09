# 家庭助手插件：Sonarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsonarr%2Fconfig.json)
![访问](https://img.shields.io/badge/dynamic/json?label=访问&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsonarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsonarr%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级Lint](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20基础)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/买杯咖啡给我%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/用%20Paypal%20给我%20买杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点过星的人！要点星，请点击下面的图片，然后它会在右上角显示。谢谢！_

[![@alexbelgium/hassio-addons的观星者](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/sonarr/stats.png)

## 关于

---

[Sonarr](https://sonarr.tv/) 是一个面向Usenet和BitTorrent用户的PVR（个人视频录像机）。它可以监控多个RSS源，以获取您喜欢的节目的新剧集，并将其抓取、排序和重命名。它还可以配置为在更高质量格式可用时，自动升级已下载文件的质量。
此插件基于Docker镜像 [https://github.com/linuxserver/docker-sonarr](https://github.com/linuxserver/docker-sonarr)

## 安装

---

此插件的安装相当简单，与安装任何其他插件没有不同。

1. 将我的插件库添加到您的家庭助手实例中（在监视器插件商店的右上角，或者如果您已配置我的HA，则单击下面的按钮）
   [![打开您的家庭助手实例并显示带有特定仓库URL预填的添加插件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击“保存”按钮以存储您的配置。
4. 根据您的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开WebUI并调整软件选项。

## 配置

---

Webui可以在 <http://homeassistant:PORT> 找到。
默认的用户名/密码：在启动日志中描述。
可以通过应用程序的WebUI进行配置，除了以下选项：

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 输入您要挂载的驱动器的硬件名称，多个名称用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的smb服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb用户名，所有smb共享相同
cifspassword: "password" # 可选，smb密码
connection_mode: ingress_noauth（默认，禁用身份验证以允许无缝的入口集成），noingress_auth（禁用入口以允许更简化的外部URL，启用身份验证），ingress_auth（同时启用入口和身份验证）
```

## 支持

在GitHub上创建一个问题

## 插图

---

![插图](https://b0b.fr/wp-content/uploads/2016/02/Sonarr-1-1000x924.jpg)

[仓库]: https://github.com/alexbelgium/hassio-addons