# 家庭助手插件：readarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库点星的人！点击下面的图片为它点星，然后在右上角会显示。谢谢！_

[![为 @alexbelgium/hassio-addons 点星的仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/readarr/stats.png)

## 关于

---

[Readarr](https://github.com/Readarr/Readarr) 是一个用于 Usenet 和 BitTorrent 用户的电子书收藏管理器。它可以监控多个 RSS 源，以获取您喜爱的作者的新书，并与客户端和索引器进行交互，以抓取、排序和重命名它们。它是电子书的书籍管理和自动化软件（类似 Sonarr）。

此插件基于 Docker 镜像 https://github.com/linuxserver/docker-readarr

## 安装

---

安装此插件非常简单，与安装其他任何插件并无不同。

1. 将我的插件库添加到您的家庭助手实例中（在右上角的管理员插件商店中，或点击下方按钮如果您已配置我的 HA）
   [![打开家庭助手实例并显示添加插件库对话框，预填特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 WebUI 并调整软件选项。

## 使用

Webui 可以在 <http://homeassistant:8787/readarr> 或通过点击 `打开 Web UI` 按钮并选择入口 ☝️ 找到。

默认用户名/密码：在启动日志中描述。

## 配置

选项可以通过三种方式进行配置：

### 插件选项

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 #将您要挂载的硬盘名称用逗号分隔，或其标签放入此处。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 SMB 服务器，用逗号分隔
cifsusername: "用户名" # 可选，SMB 用户名，适用于所有 SMB 共享
cifspassword: "密码" # 可选，SMB 密码
connection_mode: ingress_noauth (默认，禁用身份验证以允许无缝的入口集成)，noingress_auth (禁用入口以允许更简单的外部 URL，启用身份验证)，ingress_auth (同时启用入口和身份验证)
```

### 在 readarr 之内

通过应用内部的正常配置进行管理。

### ENV 重写文件：`/config/addons_config/readarr_nas.yml`

要获得更大的控制，可以通过在有效的 `.yaml` 文件中将环境变量定义为键来增加这些变量。

```yaml
TZ: Europe/Paris
```

更多信息： https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

## 支持

在 GitHub 上创建问题。

## 插图

---

![插图](https://readarr.com/img/slider/artistdetails.png)

[仓库]: https://github.com/alexbelgium/hassio-addons