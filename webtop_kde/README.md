# Home Assistant 插件：Webtop KDE Alpine

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtop%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtop%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fwebtop%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每位给我的仓库打星的朋友！要给我打星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Star 统计](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/webtop/stats.png)

## 关于

[webtop](https://github.com/webtop/webtop) 是一个完整的桌面环境，可以通过任何现代网络浏览器访问。
这个插件基于docker镜像 https://github.com/linuxserver/docker-webtop

## 配置

WebUI可以通过ingress找到，或者访问 <http://homeassistant:PORT>。默认情况下，端口是禁用的，但可以通过插件选项启用。

默认情况下，镜像基于abc用户，我们推荐使用这个用户，因为所有的初始化和配置都围绕它进行。默认密码也是abc。如果您想更改此密码并在访问界面时要求身份验证，只需在webtop的图形界面终端中执行passwd。然后在访问网页界面时使用以下路径：

http://localhost:3000/?login=true

应用程序的安装并不持久，您需要通过插件选项来进行安装。但它们的配置是持久的。

如果图形工作不正常，请使用DRINODE功能选择您的图形设备。

有关所有潜在的ENV变量，请查看： https://docs.linuxserver.io/images/docker-webtop#optional-environment-variables

```yaml
TZ: timezone ; 根据 https://manpages.ubuntu.com/manpages/trusty/man3/DateTime::TimeZone::Catalog.3pm.html 的国家/城市
additional_apps: engrampa,thunderbird # 允许安装应用程序，因为它们不是持久的
DRINODE: 指定自定义图形设备，默认为 /dev/dri/renderD128
DNS_servers: 8.8.8.8,1.1.1.1 # 保持空白以使用路由器的DNS，或者设置自定义DNS以避免在本地DNS广告移除程序中产生垃圾邮件
localdisks: sda1 # 将您的驱动器的硬件名称用逗号隔开放置，或其标签。例如：sda1，sdb1，MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，待挂载的smb服务器列表，用逗号隔开
cifsusername: "用户名" # 可选，smb用户名，所有smb共享相同
cifspassword: "密码" # 可选，smb密码
cifsdomain: "域" # 可选，允许设置smb共享的域
```

## 安装

此插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的Home Assistant实例中（在右上角的监督插件存储中，或如果您已配置我的HA，请点击下面的按钮）
   [![打开您的Home Assistant实例，并显示添加插件库对话框，预填特定库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 根据您的偏好设置插件选项
1. 启动插件。
1. 检查插件的日志，以查看是否一切正常。
1. 打开WebUI并调整软件选项

## 支持

在GitHub上创建一个问题

## 插图

![插图](https://www.linuxserver.io/user/pages/content/images/2021/05/menu.png)

[repository]: https://github.com/alexbelgium/hassio-addons