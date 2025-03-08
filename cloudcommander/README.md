# Home Assistant 插件：Cloudcommander

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcloudcommander%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=入口&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcloudcommander%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fcloudcommander%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20库)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请给我一杯咖啡%20(无%20Paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/用%20Paypal%20请我一杯咖啡-0070BA?logo=paypal&style=flat&logoColor=white

_感谢大家为我的仓库星标！要星标它，请点击下方的图片，然后在右上角将其设为星标。谢谢！_

[![@alexbelgium/hassio-addons 的星标用户](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/cloudcommander/stats.png)

## 关于

[Cloud Commander](https://github.com/coderaiser/cloudcmd) 是一个具有控制台和编辑器的网页文件管理器。
这个插件基于 [docker 镜像](https://hub.docker.com/r/coderaiser/cloudcmd)。

## 配置

Webui 可以在 `<your-ip>:8000` 找到。

```yaml
localdisks: sda1 # 输入要挂载的硬盘名称，以逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，以逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
smbv1: "bool?" # smb v1
DROPBOX_TOKEN: "str?" # 参见 https://cloudcmd.io/
CUSTOM_OPTIONS: "--name Homeassistant" # 来自 https://cloudcmd.io/ 的自定义选项
```

## 安装

这个插件的安装非常简单，和安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装这个插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。

[repository]: https://github.com/alexbelgium/hassio-addons