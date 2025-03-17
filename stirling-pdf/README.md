# Home assistant add-on: Stirling-pdf

这是一个强大的本地托管的基于网络的 PDF 操作工具，使用 Docker 构建。它使您能够对 PDF 文件执行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等。这个本地托管的 Web 应用程序已经发展成为一个全面的功能集，满足您所有的 PDF 需求。

Stirling PDF 不会发起任何出站调用以进行记录或跟踪目的。

所有文件和 PDF 文件都仅存在于客户端，或者在任务执行过程中只存在于服务器内存中，或仅临时存在于一个文件中以执行任务。用户下载的任何文件在那时将已从服务器中删除。

有点占用内存。

_感谢大家为我的仓库加星！要加星，请点击下面的图像，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用了 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

这个插件的安装非常简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。750 MB 的镜像下载可能需要一些时间。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置将位于 /addon_configs/2effc9b9_stirling-pdf
1. 停止插件，编辑 settings.yaml 文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons