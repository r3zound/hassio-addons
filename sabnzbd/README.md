# Home Assistant 插件：sabnzbd

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsabnzbd%2Fconfig.json)
![接入](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsabnzbd%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsabnzbd%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的朋友！要加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons的星标用户存储](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/sabnzbd/stats.png)

## 关于

[sabnzbd](http://sabnzbd.net/) 是一个 Usenet 下载器，使用 C++ 编写，旨在通过使用极少的系统资源来实现最大下载速度。
该插件基于docker镜像 https://github.com/linuxserver/docker-sabnzbd

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码 : 登录：sabnzbd，密码：tegbzn6789
可以通过应用程序的 webUI 进行配置，除了以下选项

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 将要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 分享相同
cifspassword: "password" # 可选，smb 密码
```

## 安装

该插件的安装相当简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到你的 Home Assistant 实例中（在超管插件商店的右上角，或如果你已配置我的 HA，请点击下面的按钮）
   [![打开你的 Home Assistant 实例，并显示带有特定仓库 URL 预填的添加插件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装该插件。
3. 点击 `保存` 按钮以保存你的配置。
4. 根据你的喜好设置插件选项
5. 启动插件。
6. 检查插件的日志，查看一切是否顺利。
7. 打开 webUI 并调整软件选项

## 支持

在 GitHub 上创建一个问题

## 插图

![插图](https://sabnzbd.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons