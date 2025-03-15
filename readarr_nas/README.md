# Home assistant 插件: readarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的库点赞的人！要给它点赞，请点击下面的图片，然后它会在右上方。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/readarr/stats.png)

## 关于

---

[Readarr](https://github.com/Readarr/Readarr) 是一个用于 Usenet 和 BitTorrent 用户的电子书收藏管理器。它可以监控多个 RSS 源，以获取你喜欢作者的新书，并将与客户端和索引器接口以抓取、排序和重命名这些书籍。是电子书管理和自动化（Sonarr for Ebooks）。
此插件基于 docker 镜像 https://github.com/linuxserver/docker-readarr

## 安装

---

此插件的安装非常简单，与安装其他插件没有什么不同。

1. 将我的插件库添加到你的 home assistant 实例中（在监督者插件商店右上方，或者如果你已经配置了我的 HA，请点击下面的按钮）
   [![打开你的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 按照你的偏好设置插件选项
1. 启动插件。
1. 检查插件的日志以查看是否一切顺利。
1. 打开 webUI 并调整软件选项

## 使用

Webui 可以在 <http://homeassistant:8787/readarr> 找到，或通过 ☝️ 点击 `打开 Web UI` 按钮。

默认用户名/密码：在启动日志中描述。

## 配置

可以通过三种方式配置选项：

### 插件选项

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 #将要挂载的驱动器的硬件名称用逗号分隔，或者它的标签。例如，sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，以逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，适用于所有 smb 共享
cifspassword: "密码" # 可选，smb 密码
connection_mode: ingress_noauth (默认，禁用身份验证以允许无缝接入整合)，noingress_auth (禁用接入以允许更简单的外部 URL，启用身份验证)，ingress_auth (同时启用接入和身份验证)
```

### 在 readarr 内部

从应用程序内的所有正常配置

### ENV 覆盖文件: `/config/addons_config/readarr_nas.yml`

为了更好的控制，你可以通过在有效的 `.yaml` 文件中将其作为键定义来添加环境变量。

```yaml
TZ: 欧洲/巴黎
```

更多信息 : https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

## 支持

在github上创建一个问题

## 插图

---

![插图](https://readarr.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons