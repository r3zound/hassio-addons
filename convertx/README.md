# Home assistant 插件：ConvertX

一个自托管的在线文件转换器。支持 831 种不同的格式。使用 TypeScript、Bun 和 Elysia 编写

_感谢每一个给我的库点星的人！要给它点星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用了 [docker 镜像](https://github.com/C4illin/ConvertX)。

## 安装

这个插件的安装相当简单，与安装其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装这个插件。2 GB 的镜像下载会花一些时间。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志，以查看一切是否正常。
1. WebUI 应该可以通过 ingress 或者 <your-ip>:port 访问。
1. 数据将在 /addon_configs/2effc9b9_convertx 中。

## 配置

```
port : 3000 #你希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons