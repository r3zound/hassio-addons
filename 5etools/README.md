# Home assistant 插件: 5etools

一套基于浏览器的工具，供 D&D 5e 的玩家和 DM 使用。下载从 5etools GitHub 发布的图片。jdeath 的仓库中没有托管或发布任何图片或内容。不提供支持，因为 Home Assistant 插件的创建者不使用此插件。自托管的图片可能会落后于 5etools 网站一个版本。图片大小为 4 GB，所以安装将需要很长时间，请耐心等待。

_感谢所有给我的仓库加星的朋友们！要加星，请点击下面的图片，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此插件的安装非常简单，与安装其他 Hass.io 插件并无不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。4 GB 的镜像下载会花费一些时间。
1. 点击 `Save` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切顺利。
1. 通过 ingress 或 <your-ip>:port 打开 WebUI 应该可以工作。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons