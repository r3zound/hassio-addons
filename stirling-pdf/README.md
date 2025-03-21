# 家庭助手附加组件: Stirling-pdf

这是一个强大的，基于网络的 PDF 操作工具，使用 Docker 本地托管。它使您能够对 PDF 文件执行各种操作，包括拆分、合并、转换、重新组织、添加图片、旋转、压缩等。这个本地托管的Web应用程序已经发展到涵盖一整套全面的功能，满足您所有的 PDF 需求。

Stirling PDF 不会为了记录或跟踪目的发起任何外部调用。

所有文件和 PDF 文件均仅存在于客户端，或在任务执行期间仅存在于服务器内存中，或者临时存在于一个仅用于执行任务的文件中。用户下载的任何文件在那时都会从服务器上删除。

占用内存有点多。

_感谢所有给我的仓库加星的人！要给它加星，请点击下面的图片，然后它将位于右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个附加组件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

这个附加组件的安装非常简单，与安装任何其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装这个附加组件。750 MB 的镜像需要一些时间来下载。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利。
1. 打开的 WebUI 应该可以通过 <your-ip>:port 访问。
1. 配置将在 /addon_configs/2effc9b9_stirling-pdf 中。
1. 停止附加组件，编辑 settings.yaml 文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons