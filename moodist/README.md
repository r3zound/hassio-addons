# Home assistant add-on: Moodist

适合集中注意力和放松的环境音效。

_感谢每位给我的仓库点星的人！要点星请点击下方的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件基于 [docker 镜像](https://github.com/remvze/moodist)。

## 安装

安装此附加组件非常简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件仓库][repository]添加到您的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `Save` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看是否一切正常。
1. 通过 ingress 或 <your-ip>:port 打开 WebUI。

## 配置

```
port : 8081 # 您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons