# Home assistant add-on: Memos

一个以隐私为首的轻量级笔记服务。轻松捕捉和分享你的精彩想法。

运行 Docker 镜像来自: https://github.com/usememos/memos


_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)


## 安装

这个附加组件的安装非常简单，和安装其他任何 Hass.io 附加组件没有什么不同。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装这个附加组件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动附加组件。
1. 检查附加组件的日志，以查看一切是否顺利。
1. 打开的 WebUI 应该可以通过 ingress 或 <your-ip>:port 进行访问。
1. 设置将存储在 /addons-config/2effc9b9_memos

## 配置

```
port : 5230 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons