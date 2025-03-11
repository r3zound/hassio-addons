# Home Assistant 附加组件: Readarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Freadarr%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级 Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有赞助我的库！要给予星标，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![星标者名单 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/readarr/stats.png)

## 介绍

---

[Readarr](https://github.com/Readarr/Readarr) 是一个适用于 Usenet 和 BitTorrent 用户的电子书管理器。它可以监控多个 RSS 源，以获取您喜欢作者的新书，并与客户端和索引器接口，以获取、排序和重命名它们。它是书籍管理和自动化（Sonarr 的电子书版）。
此附加组件基于 Docker 镜像 https://github.com/linuxserver/docker-readarr

## 安装

---

安装此附加组件相当简单，与安装其他附加组件没有区别。

1. 将我的附加组件库添加到您的 Home Assistant 实例中（在 Supervisor 附加组件商店右上方，或者如果您已经配置了我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加附加组件库对话框，特定库 URL 已预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击 `保存` 按钮以保存您的配置。
4. 根据您的偏好设置附加组件选项。
5. 启动附加组件。
6. 检查附加组件的日志以查看是否一切正常。
7. 打开 WebUI 并调整软件选项。

## 使用

Webui 可以在 <http://homeassistant:8787/readarr> 找到，或通过点击 `打开 Web UI` 按钮 ☝️ 进行访问。

默认用户名/密码：在启动日志中描述。

## 配置

选项可以通过三种方式进行配置：

### 附加组件选项

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 将您硬盘的名称以逗号分隔放入以挂载，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，适用于所有 smb 共享
cifspassword: "password" # 可选，smb 密码
connection_mode: ingress_noauth (默认，禁用身份验证以允许无缝进入集成)，noingress_auth (禁用进入以允许更简单的外部 URL，启用身份验证)，ingress_auth (同时启用进入和身份验证)
```

### 在 Readarr 内部

所有常规配置都在应用程序内进行。

### ENV 重写文件：`/config/addons_config/readarr_nas.yml`

为了获得更多控制，您可以通过在有效的 `.yaml` 文件中定义键来添加环境变量。

```yaml
TZ: Europe/Paris
```

更多信息： https://github.com/alexbelgium/hassio-addons/wiki/Add%E2%80%90ons-feature-:-add-env-variables

## 支持

在 GitHub 上创建问题

## 插图

---

![插图](https://readarr.com/img/slider/artistdetails.png)

[库]: https://github.com/alexbelgium/hassio-addons