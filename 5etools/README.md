# 家庭助理插件：5etools

一套用于D&D 5e玩家和DM的基于浏览器的工具。下载的图像来自5etools GitHub。在jdeath的代码库中不托管/发布任何图像或内容。由于家庭助理插件创建者不使用此工具，因此不提供支持。自托管的图像可能比5etools网站晚一个版本。图像大小为4 GB，因此安装需要很长时间，请耐心等待。

_感谢所有给我的代码库加星的人！要加星，请点击下面的图像，然后在右上角查看。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 图像](https://github.com/5etools-mirror-2/5etools-mirror-2.github.io)。

## 安装

这个插件的安装非常简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件代码库][repository]添加到您的Hass.io实例中。
1. 安装此插件。4 GB的图像会花费一些时间下载。
1. 点击`保存`按钮来存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 通过ingress或<your-ip>:port打开WebUI应该可以正常工作。

## 配置

```
port : 8080 #您要运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons