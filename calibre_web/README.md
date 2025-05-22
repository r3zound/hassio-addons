# Home Assistant 插件：Calibre-web

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre_web%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre_web%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre_web%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的仓库加星的朋友们！要加星请点击下面的图片，然后在右上角展示出来。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/calibre_web/stats.png)

## 关于

---

[Calibre-web](https://github.com/janeczku/calibre-web) 是一个提供干净界面的 web 应用程序，允许用户浏览、阅读和下载电子书，使用现有的 Calibre 数据库。还可以通过应用集成 Google Drive，编辑元数据和 Calibre 库。

此插件基于 docker 镜像 https://github.com/linuxserver/docker-calibre-web

## 安装

---

此插件的安装非常简单，与安装其他插件没有不同。

1. 将我的插件库添加到你的 Home Assistant 实例中（在超级用户插件商店的右上角，或者如果你已配置了我的 HA，点击下面的按钮）
   [![打开你的 Home Assistant 实例并显示添加插件库对话框，预填充特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储你的配置。
4. 根据你的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 Web UI 并调整软件选项。

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
配置可以通过应用的 webUI 完成，以下选项除外：

默认名称：admin
默认密码：admin123

```yaml
PGID: user
GPID: user
TZ: 时区
PASSWORD: 可选为 GUI 设置一个密码
CLI_ARGS: 可选为 calibre-web 传递 CLI 启动参数
localdisks: sda1 # 用逗号分隔的硬件名称挂载你的驱动器，或者其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，适用于所有 smb 共享
cifspassword: "密码" # 可选，smb 密码
force_scheme_https: 如果在使用 https 访问 ingress 时遇到问题，请勾选此框以强制使用 https
force_external_port: 如果在使用 https 访问 ingress 时遇到问题，请在此处记录用于访问 HA 的外部端口
```

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://calibre-web.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons