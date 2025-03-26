# Home assistant add-on: 5etools

一套基于浏览器的工具，供D&D 5e的玩家和DM使用。下载的图片来自5etools的GitHub。jdeath的仓库中没有托管或发布任何图片或内容。由于Home Assistant附加组件的创建者不使用此项，因此不提供支持。自托管的图片可能比5etools网站上的版本稍晚。图片大小为4 GB，因此安装将需要很长时间，请耐心等待。

_感谢所有给我的仓库加星的人！要给它加星，请点击下面的图片，然后会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用了[docker镜像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此附加组件的安装非常简单，与安装其他Hass.io附加组件没有区别。

1. [将我的Hass.io附加组件仓库][repository]添加到您的Hass.io实例。
1. 安装此附加组件。4 GB的镜像需要一段时间才能下载。
1. 点击`保存`按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看是否一切顺利。
1. 通过ingress或<your-ip>:port访问WebUI。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons