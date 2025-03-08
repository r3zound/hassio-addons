# Home assistant add-on: MeTube

youtube-dl的Web GUI（使用yt-dlp分支），支持播放列表。允许您从YouTube和其他数十个网站下载视频（https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md）。

_感谢每一个关注我的仓库的人！要关注它，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于[docker镜像](https://github.com/alexta69/metube)。

## 安装

此插件的安装相当简单，与安装其他Hass.io插件没有区别。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例。
1. 安装此插件。
1. 点击`保存`按钮以存储您的配置。
1. 下载目录默认为/share/metube，可以更改为share中的任何位置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 通过ingress或<your-ip>:port访问WebUI应该可以工作。

## 配置

```
port : 8081 #您要运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons