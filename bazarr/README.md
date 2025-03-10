# 家庭助手插件：bazarr

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbazarr%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbazarr%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbazarr%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的仓库点星的人！要点星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标用户列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/bazarr/stats.png)

## 关于

---

[Bazarr](https://www.bazarr.media/) 是一个与 Sonarr 和 Radarr 配合使用的应用程序，它根据您的需求管理和下载字幕。
该插件基于 Docker 镜像 https://github.com/linuxserver/docker-bazarr

## 配置

---

Webui 可以在 <http://homeassistant:PORT> 找到。
配置可以通过应用程序的 webUI 进行，除了以下选项：

```yaml
PGID: user
GPID: user
TZ: timezone
localdisks: sda1 # 输入要挂载的硬盘名称，以逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，对所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
```

## 安装

---

安装该插件非常简单，与安装任何其他插件没有区别。

1. 将我的插件仓库添加到您的家庭助手实例中（在管理器插件商店的右上角，或如果您已配置我的 HA 请点击下面的按钮）
   [![打开您的家庭助手实例并显示添加插件仓库对话框，其中预先填写了特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装该插件。
3. 点击 `Save` 按钮以保存您的配置。
4. 设置插件选项以满足您的偏好。
5. 启动插件。
6. 检查插件的日志查看一切是否顺利。
7. 打开 webUI 并调整软件选项。

## 支持

在 GitHub 上创建一个问题。

## 插图

---

![插图](https://www.bazarr.media/assets/img/upgrade.png)