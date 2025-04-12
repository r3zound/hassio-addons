# Home Assistant 插件：calibre

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我仓库加星的人！要加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![星标者仓库名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/calibre/stats.png)

## 关于

---

[Calibre](https://calibre-ebook.com/) 是一个强大且易于使用的电子书管理工具。用户表示它非常出色，必不可少。它几乎可以让你做任何事情，并将事情推向超越普通电子书软件的一步。它也是完全免费和开源的，适合休闲用户和计算机专家。

该插件基于 docker 镜像 https://github.com/linuxserver/docker-calibre

## 安装

---

安装此插件非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到你的 Home Assistant 实例（在监督器插件商店右上角，或者如果已配置我的 HA，请点击下面的按钮）
   [![打开你的 Home Assistant 实例，并显示添加插件库对话框，带有特定仓库 URL 的预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储你的配置。
4. 根据你的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看是否一切顺利。
7. 打开 webUI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
配置可以通过应用的 webUI 完成，以下选项除外。
请阅读上游容器文档以获取更多信息： https://github.com/linuxserver/docker-calibre/blob/35b5e3ae06ba95f666687150ca5fd632b8db9e87/README.md#application-setup

特别是，必须通过桌面应用手动启用 Web 服务器和无线连接，才能访问，使用的端口分别是 8081 和 9090。

```yaml
PGID: user
GPID: user
TZ: timezone
PASSWORD: 可选设置 GUI 密码
CLI_ARGS: 可选传递 cli 启动参数给 calibre
localdisks: sda1 # 提供驱动器的硬件名称以逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，以逗号分隔
cifsusername: "username" # 可选，所有 smb 共享的 smb 用户名
cifspassword: "password" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://calibre.com/img/slider/artistdetails.png)

[仓库]: https://github.com/alexbelgium/hassio-addons