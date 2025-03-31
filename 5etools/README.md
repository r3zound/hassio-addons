# Home assistant add-on: 5etools

一套基于浏览器的工具，供D&D 5e的玩家和DM使用。下载发布的图像来自5etools的GitHub。没有图像或内容托管/发布在jdeath的仓库上。由于Home Assistant插件创建者不使用此项，因此不提供支持。自托管的图像可能会比5etools网站晚一版本。图像大小为4 GB，因此安装时间会很长，请耐心等待。

_感谢所有给我仓库点星的朋友们！要点星，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用[docker镜像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此插件的安装非常简单，与安装其他Hass.io插件没有区别。

1. [将我的Hass.io插件仓库][repository]添加到你的Hass.io实例。
1. 安装此插件。4 GB的镜像下载需要一段时间。
1. 点击`保存`按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志，看是否一切正常。
1. 打开WebUI应该可以通过ingress或<你的-ip>:端口访问。

## 配置

```
port : 8080 #你想要运行的端口。
```

Webui可以在`<你的-ip>:端口`找到。

[repository]: https://github.com/jdeath/homeassistant-addons