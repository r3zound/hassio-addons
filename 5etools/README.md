# Home assistant add-on: 5etools

一套基于浏览器的工具，供 D&D 5e 的玩家和 DM 使用。下载的图像来自 5etools GitHub。没有图像或内容被托管/发布在 jdeath 的库上。由于 Home Assistant 附加组件的创建者不使用此组件，因此不提供支持。自托管的图像可能与 5etools 网站有一版的差异。图像大小为 4 GB，因此安装将需要较长时间，请耐心等待。

_感谢所有给我的仓库加星的朋友们！要加星，请点击下方的图像，然后在右上角进行确认。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [docker 镜像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此附加组件的安装相当简单，与安装任何其他 Hass.io 附加组件并无不同。

1. [将我的 Hass.io 附加组件库][repository]添加到您的 Hass.io 实例中。
1. 安装此附加组件。4 GB 的图像下载需要一些时间。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看是否一切顺利。
1. 打开 WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8080 # 您希望运行的端口。
```

WebUI 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons