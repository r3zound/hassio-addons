# Home Assistant 附加组件：tasmocompiler
TasmoCompiler 是一个简单的网络 GUI，允许您根据自己的设置编译出精彩的 Tasmota 固件。

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会出现在右上方。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件基于 [docker 镜像](https://hub.docker.com/r/benzino77/tasmocompiler)

## 安装

此附加组件的安装非常简单，与安装任何其他 Hass.io 附加组件没有不同。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此附加组件。
1. 点击 `Save` 按钮以保存您的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看是否一切顺利。
1. 前往本地 IP:port。由于某种原因 Ingress 无法使用。
1. 查阅官方文档以获取设置支持：https://github.com/benzino77/tasmocompiler

## 配置

```
port: 3000 # 您希望前端运行的端口
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons