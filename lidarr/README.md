# Home Assistant 插件：Lidarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20基础)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建者)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/给我买杯咖啡%20(没有%20Paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/用%20Paypal%20给我买杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！想要给我仓库加星请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/lidarr/stats.png)

## 关于

---

[Lidarr](https://lidarr.audio/) 是一个面向 Usenet 和 BitTorrent 用户的音乐收藏管理器。它可以监控多个 RSS 源，以获取您最喜欢艺术家的新专辑，并将与客户端和索引器对接，以获取、排序和重命名它们。它还可以配置为在更高质量的格式可用时，自动提升库中现有文件的质量。
该插件基于 Docker 镜像 https://github.com/linuxserver/docker-lidarr

## 安装

---

此插件的安装非常简单，与安装任何其他插件并无不同。

1. 将我的插件仓库添加到您的 Home Assistant 实例中（在管理员插件商店右上角，或如果您已配置我的 HA，点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，特定仓库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以保存您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 WebUI 并调整软件选项。

## 配置

---

WebUI 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
可以通过应用程序 WebUI 进行配置，除了以下选项

```yaml
PGID: user
GPID: user
TZ: 时区
localdisks: sda1 # 输入您要挂载的驱动器的硬件名称，用逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 分享相同
cifspassword: "密码" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://www.geekzone.fr/wp-content/uploads/2018/05/lidarr_1.png)

[repository]: https://github.com/alexbelgium/hassio-addons