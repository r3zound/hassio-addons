# Home assistant add-on: Memos

一个隐私优先、轻量级的记笔记服务。轻松捕捉并分享你的精彩想法。

从以下 Docker 镜像运行: https://github.com/usememos/memos


_感谢每一位为我的仓库点亮星星的人！点击下面的图片来为它点星，星星将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)


## 安装

这个插件的安装非常简单，和安装其他任何 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件库][repository]添加到你的 Hass.io 实例中。
1. 安装这个插件。
1. 点击 `保存` 按钮保存你的配置。
1. 启动插件。
1. 查看插件的日志，确认一切是否正常。
1. 通过 ingress 或 <你的-ip>:端口 打开 WebUI。
1. 设置将存储在 /addons-config/2effc9b9_memos

## 配置

```
port : 5230 #你希望运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons