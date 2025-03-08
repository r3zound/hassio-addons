# Home assistant 插件：ConvertX

一个自托管的在线文件转换器。支持 831 种不同的格式。使用 TypeScript、Bun 和 Elysia 编写

_感谢所有为我的仓库点星的人！要点星，请点击下面的图片，然后在右上角会出现。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用了 [docker 镜像](https://github.com/C4illin/ConvertX)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。2 GB 的镜像下载需要一些时间。
1. 点击 `Save` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. WebUI 应该可以通过入口或 <您的-ip>:端口 访问。
1. 数据将位于 /addon_configs/2effc9b9_convertx
## 配置

```
port : 3000 #您希望运行的端口。
```

Webui 可以在 `<您的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons