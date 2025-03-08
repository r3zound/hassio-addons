# Home Assistant 插件：Transmission Openvpn

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftransmission_openvpn%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftransmission_openvpn%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftransmission_openvpn%2Fconfig.json)

[![Codacy 评分徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一位给我的仓库点赞的人！要点赞请点击下面的图片，然后它会在右上角显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 仓库列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/transmission_openvpn/stats.png)

## 关于

Transmission 是一个 BitTorrent 客户端。
这个插件基于 [Haugene docker 镜像](https://github.com/haugene/docker-transmission-openvpn)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例中。
1. 安装这个插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 小心配置插件以满足你的偏好，具体请参见官方文档。

## 配置

选项：请参阅 https://github.com/haugene/docker-transmission-openvpn 获取文档

要设置自定义的 openvpn 文件（即使使用 AIRVPN），你应该将 OPENVPN_PROVIDER 设置为 "custom"，然后在你的 "OPENVPN_CONFIG" 中引用你的 ovpn 文件。例如，如果 AIRVPN 为你提供了一份名为 AIRVPN.ovpn 的 *.ovpn 文件，你需要安装一个插件，例如 Filebrowser，进入 /config/addons_config/transmission/openvpn 文件夹，并将 AIRVPN.ovpn 放在这里。然后，在插件选项中你需要在 "OPENVPN_CONFIG" 选项中写入 "AIRVPN"

完整的 transmission 选项位于 /config/addons_config/transmission（确保在修改之前停止插件，因为 Transmission 在停止时会写入其正在进行的值，可能会覆盖你的更改）

WEBPROXY_ENABLED：默认情况下，webproxy 在 8118 端口启用，但可以通过插件选项 "WEBPROXY_ENABLED" 禁用。更多信息： https://haugene.github.io/docker-transmission-openvpn/web-proxy/ （感谢 @tutorempire）

Web UI 可以在 `<your-ip>:9091` 找到。

[repository]: https://github.com/alexbelgium/hassio-addons