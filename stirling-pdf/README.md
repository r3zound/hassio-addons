# 家庭助理附加组件：Stirling-pdf

这是一个强大、基于网络的 PDF 操作工具，使用 Docker 本地托管。它使您能够对 PDF 文件进行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等。这个本地托管的 Web 应用程序已经发展成为一个全面的功能集，满足您所有的 PDF 需求。

Stirling PDF 不会发起任何外部调用用于记录或跟踪目的。

所有文件和 PDF 仅存在于客户端，或者仅在任务执行期间驻留在服务器内存中，或临时驻留在一个文件中仅用于执行该任务。用户下载的任何文件在此时都会从服务器中删除。

有点占用内存。

_感谢所有给我的代码库点星的人！要点星，请点击下面的图片，然后它将显示在右上方。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个附加组件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

这个附加组件的安装非常简单，与安装任何其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 安装这个附加组件。750 MB 的镜像下载需要一些时间。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看是否一切正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置将位于 /addon_configs/2effc9b9_stirling-pdf。
1. 停止附加组件，编辑 settings.yaml 文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons