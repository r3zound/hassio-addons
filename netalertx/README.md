# Home Assistant 插件：NetAlertX

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnetalertx%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnetalertx%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnetalertx%2Fconfig.json)
![mqtt](https://img.shields.io/badge/Service-MQTT-green.svg?logo=chromecast&logoColor=white)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的库点赞的人！要点赞，请点击下面的图片，然后它将出现在右上方。谢谢！_

[![点赞者列表 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/netalertx/stats.png)

## 关于

网络存在和入侵者探测器。扫描连接到您网络的设备，并在发现新设备和未知设备时提醒您。
此插件基于 jokob-sk 的 [docker 镜像](https://github.com/jokob-sk/NetAlertX/tree/main/dockerfiles)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 仔细配置插件以符合您的偏好，具体信息请参见官方文档。

## 配置

1. 如果不可用，应用程序会在第一次运行时生成默认的 `app.conf` 和 `app.db` 文件。
1. 通过 UI 中的设置部分管理配置是首选方式，如果 UI 无法访问，您可以直接修改 `/app/config/` 文件夹中的 `app.conf`。
1. 您必须指定应该扫描哪些网络。通过输入可以从主机访问的子网来完成此操作。如果您使用默认的 `ARPSCAN` 插件，则必须在 `SCAN_SUBNETS` 设置中指定至少一个有效的子网和接口。请参阅 [如何设置多个子网、VLAN 及其限制的文档](https://github.com/jokob-sk/NetAlertX/blob/main/docs/SUBNETS.md)以及故障排除和更高级场景的信息。
1. 了解如何通过 MQTT 插件将设备引入您的 [Home Assistant 实例](https://github.com/jokob-sk/NetAlertX/blob/main/docs/HOME_ASSISTANT.md)。
1. 通过遵循 [备份文档](https://github.com/jokob-sk/NetAlertX/blob/main/docs/BACKUPS.md) 备份所有内容。

Webui 可在 <http://homeassistant:20211> 或使用 HA ingress 找到。

<img width="500" alt="image" src="https://github.com/user-attachments/assets/fd74af43-091a-4f38-9879-037ca64cfab9" />

```yaml
PGID: user
GPID: user
```

[repository]: https://github.com/alexbelgium/hassio-addons