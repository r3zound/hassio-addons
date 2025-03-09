## &#9888; 开放请求 : [✨ [REQUEST] qBittorrent Gluetun (已开启 2024-12-10)](https://github.com/alexbelgium/hassio-addons/issues/1661) by [@xtian47](https://github.com/xtian47)
# Hass.io 插件：使用桥接的 Tor

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftor%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftor%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Ftor%2Fconfig.json)

[![Codacy 勋章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建程序](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一位给我的仓库加星的朋友！要给我加星，请点击下方的图片，然后在右上角就会显示。谢谢！_

[![@alexbelgium/hassio-addons 的 Star 用户](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/tor/stats.png)

## 介绍

这是 [Home Assistant 社区仓库中的 Tor 插件](https://github.com/hassio-addons/addon-tor) 的扩展版本，支持多个桥接协议 WebTunnel、Snowflake 和 OBFS。

## 安装

该插件的安装非常简单，与安装其他插件没有区别。

1. 将我的插件仓库添加到您的 Home Assistant 实例中（在主管插件商店右上角，或者如果您已经配置了我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，预填特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 webUI 并调整软件选项。

## 配置

您应遵循初始指南来配置基本插件选项。这里将描述与基本插件相比的额外选项：

### 选项：`http_tunnel`

将此选项设置为 true 会打开 9080 端口，以监听来自 HTTP 应用程序的连接。启用此功能后，您可以通过 HTTP 代理使用您网络上的其他应用程序访问 Tor 网络。

### 选项：`bridges`

> 确保选项值清晰，以避免意外使用传输插件和桥接。

桥接是帮助您规避审查的 Tor 中继。
访问桥接由支持的传输插件提供：

#### OBFS

由于桥接地址不是公开的，您需要自行请求它们。您有几个选择：

- 访问 [Tor][tor-bridges-obfs4] 项目并遵循说明，或
- 从 Gmail 或 Riseup 邮件地址发送电子邮件至 `bridges@torproject.org`
- 在 Telegram 上向 @GetBridgesBot 发送消息。点击“开始”或在聊天中写 /start 或 /bridges。

例如：

```yaml
bridges:
  - >-
    obfs4 123.45.67.89:443 EFC6A00EE6272355C023862378AC77F935F091E4
    cert=KkdWiWlfetJG9SFrzX8g1teBbgxtsc0zPiN5VLxqNNH+iudVW48CoH/XVXPQntbivXIqZA
    iat-mode=0
```

#### Webtunnel

访问 [Tor][tor-bridges-webtunnel] 项目并遵循说明。

例如：

```yaml
bridges:
  - >-
    webtunnel 192.0.2.3:1
    DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF
    url=https://akbwadp9lc5fyyz0cj4d76z643pxgbfh6oyc-167-71-71-157.sslip.io/5m9yq0j4ghkz0fz7qmuw58cvbjon0ebnrsp0
    ver=0.0.1
```

#### Snowflake

什么是 [snowflake][what-is-snowflake]，示例：

```yaml
bridges:
  - >-
    snowflake 192.0.2.3:80 2B280B23E1107BB62ABFC40DDCC8824814F80A72
    fingerprint=2B280B23E1107BB62ABFC40DDCC8824814F80A72
    url=https://snowflake-broker.torproject.net/
    ampcache=https://cdn.ampproject.org/
    front=www.google.com
    ice=stun:stun.l.google.com:19302,stun:stun.antisip.com:3478,stun:stun.bluesip.net:3478,stun:stun.dus.net:3478,stun:stun.epygi.com:3478,stun:stun.sonetel.com:3478,stun:stun.uls.co.za:3478,stun:stun.voipgate.com:3478,stun:stun.voys.nl:3478
    utls-imitate=hellorandomizedalpn
```

## 支持

如果您在安装时遇到问题，请务必查看 GitHub。

[tor-hidden-service]: https://www.torproject.org/docs/hidden-services.html.en
[tor-bridges-obfs4]: https://bridges.torproject.org/bridges/?transport=obfs4
[tor-bridges-webtunnel]: https://bridges.torproject.org/bridges/?transport=webtunnel
[what-is-snowflake]: https://support.torproject.org/censorship/what-is-snowflake/