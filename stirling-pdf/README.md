# Home assistant add-on: Stirling-pdf

这是一个强大且在本地托管的基于网络的 PDF 操作工具，使用 Docker。它允许你对 PDF 文件进行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等。这个本地托管的网络应用程序已经发展成为一个全面的功能集，满足你所有的 PDF 需求。

Stirling PDF 不会为了记录保存或跟踪目的发起任何外部调用。

所有文件和 PDF 文件要么仅存在于客户端，要么仅在任务执行期间驻留在服务器内存中，或仅在执行任务时暂时驻留在一个文件中。用户下载的任何文件在此时将已从服务器上删除。

有点耗内存。

_感谢所有给我的代码库点星的人！要给它点星，请单击下面的图片，然后它会位于右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

安装这个插件非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例中。
1. 安装这个插件。750 MB 的镜像需要一段时间下载。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志，看一切是否正常。
1. WebUI 应该可以通过 <你的-ip>:port 访问。
1. 设置将在 /addon_configs/2effc9b9_stirling-pdf 中。
1. 停止插件，编辑 settings.yaml 文件以更改所需的任何内容。
## 配置

```
port : 8080 #你希望运行的端口。
```

Webui 可以在 `<你的-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons