# 家庭助手插件：Ladder

Ladder 是一个网络代理，帮助绕过付费墙。这是 1ft.io 和 12ft.io 的自托管版本。它受 13ft 的启发。

Ladder 仍在不断完善中，规则集尚未填写。

_感谢每一个为我的仓库点赞的人！要点赞，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker 镜像](https://github.com/kubero-dev/ladder)。

## 安装

安装此插件非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository]添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志，以查看一切是否顺利。
1. 通过 `<your-ip>:port` 打开 WebUI 应该可行。

## 配置

```
port : 8080 #你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons