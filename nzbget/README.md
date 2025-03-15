# 家庭助手插件：nzbget

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnzbget%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnzbget%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnzbget%2Fconfig.json)

[![Codacy 勋章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码%20审查)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/给我买杯咖啡%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/通过PayPal给我买杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有支持我的仓库的用户！要支持我，请点击下面的图片，然后在右上角找到它。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/nzbget/stats.png)

## 关于

[nzbget](http://nzbget.net/) 是一个 Usenet 下载器，使用 C++ 编写，旨在以最低的系统资源实现最大的下载速度。
此插件基于 docker 镜像 https://github.com/linuxserver/docker-nzbget

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。
默认的用户名/密码: 登录: nzbget，密码: tegbzn6789
可以通过应用程序的 WebUI 进行配置，除了以下选项外：

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 #放置您的驱动器的硬件名称，用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
```

## 安装

此插件的安装非常简单，与安装任何其他插件没有不同。

1. 将我的插件仓库添加到您的家庭助手实例（在右上角的管理员插件商店中，或如果您已配置我的 HA，点击下面的按钮）
   [![打开您的家庭助手实例并显示添加插件仓库对话框，特定仓库 URL 会预先填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看是否一切顺利。
7. 打开 WebUI 并调整软件选项。

## 支持

在 GitHub 上创建一个问题。

## 插图

![插图](https://nzbget.com/img/slider/artistdetails.png)

[仓库]: https://github.com/alexbelgium/hassio-addons