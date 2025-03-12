# Home assistant add-on: Stirling-pdf

这是一个强大的、基于网络的 PDF 操作工具，托管于本地，使用 Docker。它允许您对 PDF 文件进行各种操作，包括拆分、合并、转换、重新排序、添加图片、旋转、压缩等。这个本地托管的 Web 应用程序已经发展成为一个全面的功能集，满足您所有的 PDF 需求。

Stirling PDF 不会进行任何出站呼叫以进行记录或追踪目的。

所有文件和 PDF 文件都仅存在于客户端、仅在任务执行期间驻留在服务器内存中，或仅在任务执行期间临时存在于文件中。用户下载的任何文件在此时都会从服务器中删除。

有点占用内存。

_感谢所有为我的仓库加星的人！要加星，请点击下面的图片，然后会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用了 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

此附加组件的安装相当简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例中。
1. 安装此附加组件。750 MB 的镜像下载需要一些时间。
1. 点击 `Save` 按钮以保存您的配置。
1. 启动附加组件。
1. 检查附加组件的日志，查看一切是否顺利。
1. WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置将位于 /addon_configs/2effc9b9_stirling-pdf
1. 停止附加组件，编辑 settings.yaml 文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons