# Home assistant 插件：MeTube

youtube-dl 的 Web GUI（使用 yt-dlp 分支）具有播放列表支持。允许您从 YouTube 和其他几十个网站下载视频（https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md）。

_感谢每一个关注我的仓库的人！要关注它，请点击下面的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件基于 [docker 镜像](https://github.com/alexta69/metube)。

## 安装

此插件的安装非常简单，并且与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
2. 安装此插件。
3. 点击 `Save` 按钮以保存您的配置。
4. 下载目录默认为 /share/metube，可以更改为共享中的任何内容。
5. 启动插件。
6. 检查插件的日志以查看一切是否顺利。
7. WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8081 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons