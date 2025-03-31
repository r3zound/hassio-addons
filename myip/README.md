# Home assistant 插件: MyIP

MyIP 是一款先进的 IP 工具，旨在提供有关您 IP 地址的广泛信息和诊断。它非常适合需要查看和分析其 IP 详细信息的用户，还可以检查网站可达性、执行 DNS 泄漏测试等。

_感谢所有给我的仓库加星的人！要加星，请点击下方的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用了 [docker 镜像](https://github.com/jason5ng32/MyIP)。

## 安装

安装此插件非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 可以通过 <your-ip>:port 打开 WebUI。

## 配置

```
port : 18966 #您想要运行的端口。
```

Webui 可在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons