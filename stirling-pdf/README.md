# Home assistant 插件: Stirling-pdf

这是一个强大的本地托管的基于网页的 PDF 操作工具，使用 Docker。它使您能够对 PDF 文件执行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等。这个本地托管的网页应用程序已经演变为包含一整套完整的功能，满足您所有的 PDF 需求。

Stirling PDF 不会为了记录或跟踪的目的进行任何外部调用。

所有文件和 PDF 文件要么完全存在于客户端，要么仅在任务执行期间存在于服务器内存中，或者仅为执行任务而暂时存在于一个文件中。用户下载的任何文件在那个时刻都将已从服务器中删除。

有点吃内存。

_感谢所有给我的 repo 点星的人！要点星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository]添加到您的 Hass.io 实例中。
1. 安装这个插件。750 MB 的镜像下载会花费一些时间。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置将保存在 /addon_configs/2effc9b9_stirling-pdf。
1. 停止插件，编辑 settings.yaml 文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons