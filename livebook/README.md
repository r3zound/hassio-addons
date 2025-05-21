# Home assistant 插件: Livebook

Livebook 是一个用于编写交互式和协作式代码笔记本的网页应用程序

_感谢所有给我的仓库加星的人！要加星，请点击下方的图像，然后将其放在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/livebook-dev/livebook)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository]添加到你的 Hass.io 实例中。
1. 点击 `保存` 按钮以保存你的配置。
1. 启动插件。
1. 查看插件的日志以确认一切正常。
1. WebUI 应能通过 <your-ip>:port 访问。
1. 数据将会在 /addon_configs/2effc9b9_livebook 中。
## 配置

```
port : 8080 #你希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons