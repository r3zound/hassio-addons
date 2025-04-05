# Home Assistant 插件: sabnzbd

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsabnzbd%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsabnzbd%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fsabnzbd%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一位给我的仓库评级的朋友！要评级，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Star 统计库列表 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/sabnzbd/stats.png)

## 关于

[sabnzbd](http://sabnzbd.net/) 是一个 Usenet 下载器，采用 C++ 编写，专为性能而设计，旨在通过使用非常少的系统资源来实现最大下载速度。
此插件基于 Docker 镜像 https://github.com/linuxserver/docker-sabnzbd

## 配置

WebUI 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码 : 登录名:sabnzbd，密码:tegbzn6789
通过应用程序 WebUI 进行配置，以下选项除外：

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 用逗号分隔，放入要挂载的硬盘的硬件名称或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 SMB 服务器列表，逗号分隔
cifsusername: "username" # 可选，SMB 用户名，所有 SMB 共享相同
cifspassword: "password" # 可选，SMB 密码
```

## 安装

安装此附加组件非常简单，与安装其他任何附加组件没有区别。

1. 将我的附加组件库添加到您的家庭助手实例中（在监督者附加组件商店右上角，或如果您已配置了我的 HA，则单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加附加组件库对话框，特定库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击 `Save` 按钮以保存您的配置。
4. 设置附加组件选项以满足您的偏好。
5. 启动附加组件。
6. 检查附加组件的日志以查看一切是否顺利。
7. 打开 WebUI 并调整软件选项。

## 支持

在 GitHub 上创建一个问题。

## 插图

![插图](https://sabnzbd.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons