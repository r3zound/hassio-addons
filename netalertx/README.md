# Home Assistant 插件: NetAlertX

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnetalertx%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnetalertx%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fnetalertx%2Fconfig.json)
![mqtt](https://img.shields.io/badge/Service-MQTT-green.svg?logo=chromecast&logoColor=white)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我仓库加星的人！想要加星请点击下方图片，然后它将出现在右上角。谢谢！_

[![为@alexbelgium/hassio-addons的星标用户](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/netalertx/stats.png)

## 关于

网络存在及入侵检测器。扫描连接到您的网络的设备，并在发现新设备和未知设备时提醒您。
该插件基于 [jokob-sk](https://github.com/jokob-sk/NetAlertX/tree/main/dockerfiles) 的 [docker 镜像](https://github.com/jokob-sk/NetAlertX/tree/main/dockerfiles)。

## 安装

安装此插件非常简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件库][repository]添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 仔细根据您的偏好配置插件，具体请见官方文档。

## 配置

1. 如果不可用，应用程序将在首次运行时生成默认的 `app.conf` 和 `app.db` 文件。
1. 偏好的方式是通过 UI 的设置部分管理配置，如果 UI 无法访问，您可以直接在 `/app/config/` 文件夹中修改 `app.conf`。
1. 您必须指定应该扫描哪些网络。这是通过输入从主机可访问的子网来完成的。如果使用默认的 `ARPSCAN` 插件，则必须在 `SCAN_SUBNETS` 设置中指定至少一个有效的子网和接口。请参阅 [如何设置多个子网、VLAN及其限制的文档](https://github.com/jokob-sk/NetAlertX/blob/main/docs/SUBNETS.md) 以及故障排除和更高级的场景。
1. 阅读如何通过 [MQTT 插件将设备导入您的 Home Assistant 实例](https://github.com/jokob-sk/NetAlertX/blob/main/docs/HOME_ASSISTANT.md)。
1. 根据 [备份文档](https://github.com/jokob-sk/NetAlertX/blob/main/docs/BACKUPS.md) 备份所有内容。

Webui 可以在 <http://homeassistant:20211> 找到，或使用 HA ingress。

<img width="500" alt="image" src="https://github.com/user-attachments/assets/fd74af43-091a-4f38-9879-037ca64cfab9" />

```yaml
PGID: user
GPID: user
```

[repository]: https://github.com/alexbelgium/hassio-addons