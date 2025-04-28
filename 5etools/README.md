# Home assistant add-on: 5etools

一套基于浏览器的工具，供D&D 5e的玩家和DM使用。下载上传的图片来自5etools的GitHub。没有任何图片或内容被托管/上传在jdeath的仓库上。由于Home Assistant Addon创建者不使用此工具，因此不提供支持。自托管的图像可能会比5etools网站落后一个版本。图像文件大小为4GB，因此安装将需要较长时间，请耐心等待。

_感谢所有为我的仓库点过星的朋友们！要点星，请点击下面的图片，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [docker image](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此附加组件的安装非常简单，与安装任何其他Hass.io附加组件没有什么不同。

1. [将我的Hass.io附加组件仓库][repository]添加到你的Hass.io实例中。
1. 安装此附加组件。4GB的镜像下载将需要一段时间。
1. 点击`保存`按钮以保存你的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看是否一切正常。
1. 通过ingress或<你的IP>:端口打开WebUI。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui可以在`<你的IP>:端口`找到。

[repository]: https://github.com/jdeath/homeassistant-addons