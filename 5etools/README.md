# Home assistant 插件: 5etools

一套基于浏览器的工具，供 D&D 5e 的玩家和 DM 使用。下载自 5etools GitHub 的发布图像。没有图像或内容托管/发布在 jdeath 的仓库上。由于 Home Assistant 插件创建者不使用此功能，因此没有提供支持。自托管的图像可能比 5etools 网站滞后一个版本。图像大小为 4 GB，因此安装将需要很长时间，请耐心等待。

_感谢所有给我的仓库加星的朋友们！要加星，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker image](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。4 GB 的图像将需要一段时间来下载。
1. 单击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志，以查看一切是否正常。
1. WebUI 应该可以通过 ingress 或 <your-ip>:port 访问。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons