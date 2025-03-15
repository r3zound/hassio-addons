# Home assistant 插件: mylar3

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmylar3%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmylar3%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fmylar3%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有关注我的仓库的人！要关注它，请点击下面的图像，然后它将出现在右上方。谢谢！_

[![关注者名单，为 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/mylar3/stats.png)

## 关于

[mylar3](https://github.com/mylar3/mylar3) 是一个自动化漫画书下载工具（cbr/cbz），用于与 NZB 和种子一起使用，使用 Python 编写。除了 DDL，支持 SABnzbd、NZBGET 和许多种子客户端。
此插件基于 docker 镜像 https://github.com/linuxserver/docker-mylar3

## 安装

该插件的安装非常简单，与安装任何其他插件没有区别。

1. 将我的插件库添加到您的 home assistant 实例中（在 supervisor 插件商店右上角，或者如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例，并显示带有预填充特定存储库 URL 的添加插件库对话框。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `Save` 按钮以保存您的配置。
4. 根据您的喜好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 webUI 并调整软件选项

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。
默认的用户名/密码：在启动日志中描述。
配置可以通过应用的 webUI 完成，除了以下选项

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 #将要挂载的驱动器的硬件名称以逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，逗号分隔
cifsusername: "username" # 可选，smb 用户名，适用于所有 smb 共享
cifspassword: "password" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题

## 插图

![插图](https://d33wubrfki0l68.cloudfront.net/664a5e42eeb092c4e544606ea29b09a8379ff234/cfe2c/images/mylar.jpg)

[repository]: https://github.com/alexbelgium/hassio-addons