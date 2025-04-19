# Home assistant 插件：MeTube

用于 youtube-dl (使用 yt-dlp 分支) 的 Web 界面，支持播放列表。允许您从 YouTube 和其他数十个网站下载视频（https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md）。

_感谢所有给我的代码库加星的人！要加星，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker 镜像](https://github.com/alexta69/metube)。

## 安装

该插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 下载目录默认为 /share/metube，可以更改为 share 中的任何位置。
1. 启动插件。
1. 检查插件的日志，以查看一切是否正常。
1. 通过 ingress 或 <your-ip>:port 打开 WebUI。

## 配置

```
port : 8081 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons