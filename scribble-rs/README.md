# Home assistant 插件: Scribble-rs

Scribble.rs 是 web 基于的画画游戏 skribbl.io 的替代品。对我而言，使用 skribbl.io 的主要问题是广告和掉线会导致你失去积分。除此之外，自动的单词选择非常令人烦恼并造成一些挫折感。

_感谢所有给我的代码库点星的人！要给我点星，请点击下面的图像，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 https://github.com/scribble-rs/scribble.rs。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件代码库][repository] 添加到你的 Hass.io 实例。
1. 安装这个插件。
1. 启动插件。
1. 检查插件的日志，以查看一切是否顺利。
1. 打开的 WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8080 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。