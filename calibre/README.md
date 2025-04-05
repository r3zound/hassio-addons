# Home Assistant 插件: calibre

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/买我一杯咖啡%20(无%20PayPal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/通过%20PayPal%20买我一杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！若要加星，请点击下方图片，然后它将位于右上角。谢谢！_

[![@alexbelgium/hassio-addons的星际观察者仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/calibre/stats.png)

## 关于

---

[Calibre](https://calibre-ebook.com/) 是一个强大且易于使用的电子书管理工具。用户称它出色且必备。它几乎可以让你做所有事情，并进一步超越普通的电子书软件。它也是完全免费的开源软件，非常适合普通用户和计算机专家。

此插件基于 Docker 镜像 https://github.com/linuxserver/docker-calibre

## 安装

---

安装此插件非常简单，与安装任何其他插件没有区别。

1. 将我的插件仓库添加到你的 Home Assistant 实例中（在右上角的管理员插件商店，或者单击下面的按钮，如果你已配置我的 HA）
   [![打开你的 Home Assistant 实例并显示添加插件仓库对话框，特定的仓库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以保存你的配置。
4. 根据你的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 webUI 并调整软件选项。

## 配置

---

WebUI 可以在 <http://homeassistant:PORT> 找到。
可通过应用程序 WebUI 进行配置，除了以下选项。
请查看上游容器文档以获取更多信息：https://github.com/linuxserver/docker-calibre/blob/35b5e3ae06ba95f666687150ca5fd632b8db9e87/README.md#application-setup

特别是，必须从桌面应用程序手动启用网络服务器和无线连接才能访问，分别使用端口 8081 和 9090。

```yaml
PGID: 用户组ID
GPID: 用户ID
TZ: 时区
PASSWORD: 可选择设置 GUI 的密码
CLI_ARGS: 可选择传递 CLI 启动参数给 calibre
localdisks: sda1 #将你的驱动器挂载的硬件名称用逗号分隔，或它的标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 SMB 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，SMB 用户名，所有 SMB 共享均相同
cifspassword: "密码" # 可选，SMB 密码
```

## 支持

在 GitHub 上创建问题

## 插图

---

![插图](https://calibre.com/img/slider/artistdetails.png)

[仓库]: https://github.com/alexbelgium/hassio-addons