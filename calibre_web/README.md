# Home Assistant 插件：Calibre-web

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre_web%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre_web%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcalibre_web%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级代码检查](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后在右上角它会显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载统计](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/calibre_web/stats.png)

## 关于

---

[Calibre-web](https://github.com/janeczku/calibre-web) 是一个网页应用程序，提供一个干净的界面用于浏览、阅读和下载电子书，使用现有的 Calibre 数据库。也可以通过应用程序本身集成 Google Drive，并编辑元数据和您的 Calibre 库。

此插件基于 Docker 镜像 https://github.com/linuxserver/docker-calibre-web

## 安装

---

安装此插件非常简单，与安装任何其他插件没有不同。

1. 将我的插件库添加到您的 Home Assistant 实例（在主管插件商店右上角，或者如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `Save` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志，查看是否一切正常。
7. 打开 webUI 并调整软件选项

## 配置

---

Webui 可在 <http://homeassistant:PORT> 访问。
默认用户名/密码：在启动日志中说明。
可以通过应用程序 webUI 进行配置，除了以下选项

默认名称：admin
默认密码：admin123

```yaml
PGID: user
GPID: user
TZ: timezone
PASSWORD: 可选设置 gui 密码
CLI_ARGS: 可选传递 cli 启动参数给 calibre-web
localdisks: sda1 # 将硬盘的名称以逗号分隔放入来挂载，或其标签，例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，对所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
force_scheme_https: 如果您访问 ingress 时遇到问题，请勾选此框以强制使用 https
force_external_port: 如果您访问 ingress 时遇到问题，请在此处备注您用于访问 HA 的外部端口
```

## 支持

在 GitHub 上创建一个问题

## 插图

---

![插图](https://calibre-web.com/img/slider/artistdetails.png)

[repository]: https://github.com/alexbelgium/hassio-addons