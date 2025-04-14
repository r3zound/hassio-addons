# 家庭助手插件: Stirling-pdf

这是一个强大的本地托管的基于网页的 PDF 操作工具，使用 Docker。它允许您对 PDF 文件执行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等等。这个本地托管的 web 应用程序已经发展到涵盖全面的功能集，满足您所有的 PDF 需求。

Stirling PDF 不会发起任何出站电话用于记录或跟踪目的。

所有文件和 PDF 要么仅存在于客户端，要么在任务执行期间仅存在于服务器内存中，或仅临时存在于一个文件中以执行该任务。用户下载的任何文件在此时都将从服务器上被删除。

有点占内存。

_感谢所有为我的仓库点赞的人！要点赞，请点击下方的图片，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

此插件的安装相当简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。750 MB 的镜像下载可能需要一些时间。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. WebUI 应通过 <your-ip>:port 工作。
1. 设置将位于 /addon_configs/2effc9b9_stirling-pdf
1. 停止插件，编辑 settings.yaml 文件以更改所需的任何内容。

## 配置

```
port : 8080 # 您希望运行的端口。
```

Webui 可在 `<your-ip>:port` 处找到。

[repository]: https://github.com/jdeath/homeassistant-addons