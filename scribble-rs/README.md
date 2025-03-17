# Home assistant 插件: Scribble-rs

Scribble.rs 是一个基于网页的绘画游戏 skribbl.io 的替代品。我对 skribbl.io 的主要问题是广告以及断开连接会导致失去积分。此外，自动选择单词相当烦人，造成了一些挫败感。

_感谢每一位给我的仓库加星的人！要给我加星，请点击下面的图片，然后在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 https://github.com/scribble-rs/scribble.rs。

## 安装

此插件的安装相当简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. WebUI 应该可以通过 ingress 或 <your-ip>:port 访问。

## 配置

```
port : 8080 # 你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。