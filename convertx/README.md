# 家庭助理附加组件: ConvertX

一个自托管的在线文件转换器。支持831种不同格式。使用TypeScript、Bun和Elysia编写

_感谢每一个给我的仓库加星的人！要加星，请点击下方的图片，然后它会显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个附加组件使用了 [docker 镜像](https://github.com/C4illin/ConvertX)。

## 安装

这个附加组件的安装非常简单，与安装任何其他Hass.io附加组件没有区别。

1. [将我的Hass.io附加组件仓库][repository]添加到您的Hass.io实例。
2. 安装这个附加组件。2GB的镜像下载会花一些时间。
3. 点击`保存`按钮以保存您的配置。
4. 启动附加组件。
5. 检查附加组件的日志以查看一切是否顺利。
6. 打开的WebUI应该通过ingress或<你的IP>:端口工作。
7. 数据将存放在 /addon_configs/2effc9b9_convertx。

## 配置

```
port : 3000 #您希望运行的端口。
```

Webui 可以在 `<你的IP>:端口` 处找到。

[repository]: https://github.com/jdeath/homeassistant-addons