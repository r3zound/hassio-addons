# Home Assistant 插件：Codex

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcodex%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcodex%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcodex%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码%20检测)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建者)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20请我喝咖啡%20(无%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20请我喝咖啡%20使用%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的库点过星的人！要点星请点击下面的图片，然后它会在右上角，谢谢！_

[![@alexbelgium/hassio-addons 的星标观众名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/codex/stats.png)

## 关于

---

[Codex](https://github.com/ajslater/codex) 是一个基于网页的漫画档案浏览器和阅读器。
此插件基于官方 docker 镜像：https://hub.docker.com/r/ajslater/codex

## 安装

---

此插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例（在监视器插件商店的右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预填特定的仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志，以查看一切是否正常。
7. 打开 webUI 并调整软件选项。

## 配置

WebUI 可以在 <http://homeassistant:PORT> 找到。
默认用户名/密码：在启动日志中描述。
可以通过应用的 WebUI 进行配置，但以下选项除外。

## 添加主题/骨架

您可以将主题/骨架的用户文件夹放置在 /share/codex/www/user 中。

## 选项

```yaml
PGID: user
GPID: user
TZ : 将明确指定时区，使用长格式（例如 "America/Los Angeles"）。这在 Docker 内部非常有用，因为 Codex 无法自动检测主机机器的时区。
CODEX_RESET_ADMIN=1 : 将在 Codex 启动时重置管理员用户及其密码为默认值。
CODEX_SKIP_INTEGRITY_CHECK=1 : 将跳过在 Codex 启动时运行的数据库完整性修复。
csrf_allowed : 用逗号分隔的地址列表，允许访问应用程序。
localdisks: sda1 # 将要挂载的硬件驱动器名称以逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 SMB 服务器，以逗号分隔。
cifsusername: "用户名" # 可选，SMB 用户名，适用于所有 SMB 共享。
cifspassword: "密码" # 可选，SMB 密码。
```

## 插图

![图片](https://github.com/alexbelgium/hassio-addons/assets/44178713/f1cf3cad-5bda-46df-a0f5-864b127d7b6b)

## 支持

在 GitHub 上创建一个问题。

[仓库]: https://github.com/alexbelgium/hassio-addons