# Home assistant 插件：Moodist

用于专注和冷静的环境声音。

_感谢所有为我的仓库点赞的人！要点赞，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://github.com/remvze/moodist)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository]添加到你的 Hass.io 实例。
1. 安装这个插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切顺利。
1. 打开的 WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8081 #你希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons