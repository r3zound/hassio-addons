# Home assistant 插件：5etools

一套面向 D&D 5e 玩家和 DM 的基于浏览器的工具。下载的图像来自 5etools GitHub。jdeath 的仓库不托管/发布任何图像或内容。由于 Home Assistant 插件创建者不使用此工具，因此不提供支持。自托管的图像可能比 5etools 网站晚一个版本。图像大小为 4 GB，因此安装将花费较长时间，请耐心等待。

_感谢所有为我的仓库星标的人！要给它星标，请点击下面的图像，然后在右上角进行操作。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

安装此插件非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。4 GB 的镜像下载会花费一些时间。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. WebUI 应可通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons