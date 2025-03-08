# 家庭助手附加组件：5etools

一套基于浏览器的工具，供 D&D 5e 的玩家和 DM 使用。下载的图像来自 5etools 的 GitHub。jdeath 的仓库不托管/发布任何图像或内容。由于家庭助手附加组件创建者不使用此工具，因此不提供支持。自托管的图像可能比 5etools 网站的版本滞后一个修订版。图像大小为 4 GB，因此安装会耗时较长，请耐心等待。

_感谢大家为我的仓库加星！要加星，请点击下面的图像，然后会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [docker 镜像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

此附加组件的安装非常简单，与安装其他 Hass.io 附加组件没有不同。

1. [将我的 Hass.io 附加组件存储库][repository]添加到您的 Hass.io 实例。
1. 安装此附加组件。4 GB 的图像将需要一些时间才能下载。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利。
1. 打开的 WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons