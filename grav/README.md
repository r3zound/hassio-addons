# Home Assistant 插件：Grav

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fgrav%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fgrav%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fgrav%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有关注我的仓库的人！点击下面的图像来关注它，然后它会在右上角。谢谢！_

[![关注者列表 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/grav/stats.png)

## 关于

---

[Grav](https://getgrav.org) 是一个免费的软件，自托管的内容管理系统（CMS），用 PHP 编程语言编写，并基于 Symfony Web 应用框架。它使用平面文件数据库用于后端和前端。
此插件基于 docker 镜像 https://github.com/linuxserver/docker-grav

## 安装

---

此插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件仓库添加到你的 Home Assistant 实例（在监督者插件商店右上角，或如果你已配置我的 HA，请点击下面的按钮）
   [![打开你的 Home Assistant 实例并显示添加插件仓库对话框，特定的仓库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以保存你的配置。
4. 根据你的偏好设置插件选项
5. 启动插件。
6. 查看插件的日志以查看一切是否顺利。
7. 打开 WebUI 并调整软件选项

## 配置

Webui 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
可以通过应用 WebUI 进行配置，除了以下选项

## 添加主题/骨架

你可以将主题/骨架的用户文件夹放置在 /share/grav/www/user 中，

## 选项

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 #将你的驱动器的硬件名称以逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，以逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
```

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://getgrav.org/user/pages/01.tour/_easy-to-use/001-dashboard.png)

[仓库]: https://github.com/alexbelgium/hassio-addons