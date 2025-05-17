# Home Assistant 插件：jackett

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjackett%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjackett%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fjackett%2Fconfig.json)

[![Codacy 评分徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点星的人！要点星，请点击下面的图片，接着它将显示在右上角。谢谢！_

[![@alexbelgium/hassio-addons 的星标用户名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/jackett/stats.png)

## 关于

[jackett](https://github.com/jackett/jackett) - Jackett 的一个分支，旨在与像 Couchpotato 这样的电影工作。

此插件基于来自 linuxserver.io 的 [docker 镜像](https://github.com/linuxserver/docker-jackett)。

## 配置

可以通过应用的 WebUI 进行配置，除了以下选项外：

```yaml
PGID: 用户
GPID: 用户
TZ: 时区
localdisks: sda1 #输入要挂载的驱动器的硬件名称，用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享使用相同的用户名
cifspassword: "密码" # 可选，smb 密码
```

## 安装

此插件的安装相当简单，与安装其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库加入你的 Hass.io 实例][repository]。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 根据你的偏好仔细配置插件，具体请参考官方文档。

[repository]: https://github.com/alexbelgium/hassio-addons