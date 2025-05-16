# Home assistant 插件: ConvertX

一个自托管的在线文件转换器。支持831种不同的格式。使用TypeScript、Bun和Elysia编写。

_感谢所有给我仓库加星的人！要加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用[docker镜像](https://github.com/C4illin/ConvertX)。

## 安装

此插件的安装非常简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例中。
1. 安装此插件。2 GB的镜像下载会需要一些时间。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 通过ingress或<your-ip>:port打开WebUI应该可以工作。
1. 数据将位于/addon_configs/2effc9b9_convertx
## 配置

```
port : 3000 #您希望运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons