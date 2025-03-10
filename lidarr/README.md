# 家庭助理插件：Lidarr

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Flidarr%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的库加星的人！要加星，请点击下面的图像，然后会出现右上角的选项。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/lidarr/stats.png)

## 关于

---

[Lidarr](https://lidarr.audio/) 是一个用于 Usenet 和 BitTorrent 用户的音乐收藏管理器。它可以监控多个 RSS 源以获取您喜欢艺术家的新专辑，并与客户端和索引器接口，以抓取、排序和重命名它们。它还可以被配置为在更高质量格式可用时自动升级库中现有文件的质量。
该插件基于 Docker 镜像 https://github.com/linuxserver/docker-lidarr

## 安装

---

此插件的安装非常简单，与安装其他任何插件没有不同。

1. 将我的插件库添加到您的家庭助理实例中（在 Supervisor 插件商店的右上角，或者在您配置了我的 HA 的情况下点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以保存您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. 打开 WebUI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
配置可以通过应用的 WebUI 进行，以下选项除外：

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 设备的名称分开用逗号，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://www.geekzone.fr/wp-content/uploads/2018/05/lidarr_1.png)

[repository]: https://github.com/alexbelgium/hassio-addons