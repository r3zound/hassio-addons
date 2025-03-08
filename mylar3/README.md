# Home Assistant 插件：mylar3

[![捐助][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐助][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmylar3%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmylar3%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmylar3%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20基础)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20给我%20买杯%20咖啡%20(无%20Paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20给我%20买杯%20咖啡%20使用%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的仓库点赞的人！要点赞，请点击下方的图片，然后它将在右上角。谢谢！_

[![点赞者仓库名单为 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/mylar3/stats.png)

## 关于

[mylar3](https://github.com/mylar3/mylar3) 是一个用于 NZB 和 torrent 的自动漫画下载器（cbr/cbz），使用 Python 编写。它支持 SABnzbd、NZBGET 以及许多 torrent 客户端，除了 DDL 之外。
该插件基于 docker 镜像 https://github.com/linuxserver/docker-mylar3

## 安装

该插件的安装相当简单，与安装其他任何插件没有不同。

1. 将我的插件仓库添加到你的 Home Assistant 实例（在超级用户插件商店的右上角，或者如果你已经配置了我的 HA，请点击下面的按钮）
   [![打开你的 Home Assistant 实例并显示添加插件仓库对话框，预填充特定的仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装该插件。
3. 点击 `保存` 按钮以存储你的配置。
4. 根据你的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志，查看是否一切顺利。
7. 打开 webUI 并调整软件选项。

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。
默认的用户名/密码：在启动日志中描述。
除以下选项外，配置可以通过应用程序 webUI 完成。

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 # 将要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
```

## 支持

在 GitHub 上创建问题

## 插图

![插图](https://d33wubrfki0l68.cloudfront.net/664a5e42eeb092c4e544606ea29b09a8379ff234/cfe2c/images/mylar.jpg)

[仓库]: https://github.com/alexbelgium/hassio-addons