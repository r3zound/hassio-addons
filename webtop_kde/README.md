# 家庭助理插件: Webtop KDE Alpine

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtop%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtop%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtop%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一位为我的仓库点赞的人！要给它加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![星标一览 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/webtop/stats.png)

## 关于

[webtop](https://github.com/webtop/webtop) 是一个完整的桌面环境，可以通过任何现代网页浏览器访问。
该插件基于 docker 镜像 https://github.com/linuxserver/docker-webtop

## 配置

Webui 可以通过入口或在 <http://homeassistant:PORT> 找到。端口默认情况下是禁用的，但可以通过插件选项启用。

默认情况下，该镜像是基于 abc 用户，我们建议使用该用户，因为所有的初始化/配置都是围绕它进行的。默认密码也是 abc。如果您想更改此密码，并在访问界面时需要身份验证，只需在 webtop 的 GUI 终端中输入 passwd。然后在访问网页界面时使用以下路径：

http://localhost:3000/?login=true

应用程序的安装不是持久的，您需要通过插件选项进行安装。然而，它们的配置是持久的。

如果图形无法工作，请使用 DRINODE 功能选择您的图形设备。

请在此处查看所有可能的 ENV 变量 : https://docs.linuxserver.io/images/docker-webtop#optional-environment-variables

```yaml
TZ: 时区 ; 根据 https://manpages.ubuntu.com/manpages/trusty/man3/DateTime::TimeZone::Catalog.3pm.html 的国家/城市
additional_apps: engrampa,thunderbird # 允许安装应用程序，因为它们不是持久的
DRINODE: 指定自定义图形设备，默认是 /dev/dri/renderD128
DNS_servers: 8.8.8.8,1.1.1.1 # 保持空白以使用路由器的 DNS，或设置自定义 DNS 以避免在本地 DNS 广告移除器情况下的垃圾邮件
localdisks: sda1 # 输入要挂载的驱动器硬件名称，用逗号分隔，或其标签。比如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许为 smb 共享设置域
```

## 安装

此插件的安装非常简单，与安装任何其他插件没有区别。

1. 将我的插件库添加到您的家庭助理实例（在监控器插件商店右上角，或如果您已经配置了我的 HA，请单击下面的按钮）
   [![打开您的家庭助理实例并显示添加插件仓库对话框，预填充特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 单击 `保存` 按钮以存储您的配置。
1. 根据您的偏好设置插件选项
1. 启动插件。
1. 检查插件的日志，以查看是否一切正常。
1. 打开 webUI 并调整软件选项

## 支持

在 GitHub 上创建一个问题

## 插图

![插图](https://www.linuxserver.io/user/pages/content/images/2021/05/menu.png)

[repository]: https://github.com/alexbelgium/hassio-addons