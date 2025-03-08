# 家庭助手插件：Stirling-pdf

这是一个稳健的本地托管基于网络的PDF处理工具，使用Docker。它使您能够对PDF文件执行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等。这个本地托管的Web应用程序已经发展成一个全面的功能集，满足您所有的PDF需求。

Stirling PDF不会发起任何外部调用用于记录或跟踪目的。

所有文件和PDF均仅存在于客户端，或者在任务执行期间仅存在于服务器内存中，或临时存在于文件中专用于任务执行。用户下载的任何文件在那时都会被从服务器中删除。

占用一点内存。

_感谢所有给我的仓库点星的人！要点星，请点击下方的图像，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用了 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

此插件的安装非常简单，与安装任何其他Hass.io插件相比没有什么不同。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例中。
1. 安装此插件。750 MB的镜像将需要一些时间下载。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. WebUI应通过<您的IP>:端口正常工作。
1. 设置将在 /addon_configs/2effc9b9_stirling-pdf 中。
1. 停止插件，编辑settings.yaml文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui可以在`<您的IP>:端口`找到。

[repository]: https://github.com/jdeath/homeassistant-addons