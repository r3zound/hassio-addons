# Home assistant 插件：MeTube

用于 youtube-dl 的 Web GUI（使用 yt-dlp 分支）并支持播放列表。允许您从 YouTube 和数十个其他网站下载视频（https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md）。

_感谢所有为我的库点赞的人！要点赞，请点击下方图片，然后它将显示在右上角。谢谢！_

[![为 @jdeath/homeassistant-addons 的 Stargazers 仓库名单](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件基于 [docker 镜像](https://github.com/alexta69/metube)。

## 安装 

该插件的安装相当简单，与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 默认下载目录为 /share/metube，可以改为 share 中的任何目录。
1. 启动该插件。
1. 检查插件的日志，以查看一切是否正常。
1. 打开的 WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 配置

```
port : 8081 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons