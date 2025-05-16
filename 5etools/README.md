# Home assistant add-on: 5etools

一套基于浏览器的工具，供 D&D 5e 的玩家和地下城主使用。下载的图像来自 5etools GitHub。没有任何图像或内容在 jdeath 的库中托管/发布。由于 Home Assistant 插件创建者不使用此插件，因此不提供支持。自托管的图像可能比 5etools 网站晚一个版本。图像大小为 4 GB，因此安装可能需要较长时间，请耐心等待。

_感谢每一个为我的库加星的人！要加星，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 图像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。4 GB 的图像下载需要一些时间。
1. 单击 `保存` 按钮以存储您的配置。
1. 启动该插件。
1. 检查插件的日志以查看是否一切正常。
1. WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8080 # 您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons