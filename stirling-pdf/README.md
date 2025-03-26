# Home assistant 插件：Stirling-pdf

这是一个强大的本地托管的基于网页的 PDF 操作工具，使用 Docker。它使您能够对 PDF 文件执行各种操作，包括拆分、合并、转换、重新组织、添加图像、旋转、压缩等。这款本地托管的网络应用程序已经发展成为一个全面的功能集，满足您所有的 PDF 需求。

Stirling PDF 不会发起任何出站调用用于记录保存或跟踪目的。

所有文件和 PDF 文件仅存在于客户端，或者仅在任务执行期间驻留在服务器内存中，或者仅为执行任务而暂时驻留在文件中。用户下载的任何文件在那时都会从服务器上删除。

稍微占用内存。

_感谢大家给我的仓库加星！点击下面的图像为其加星，然后它会显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

安装此插件相当简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
2. 安装此插件。750 MB 的镜像下载将需要一些时间。
3. 点击 `保存` 按钮以存储您的配置。
4. 启动插件。
5. 检查插件的日志以确保一切正常。
6. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
7. 设置将在 /addon_configs/2effc9b9_stirling-pdf 中。
8. 停止插件，编辑 settings.yaml 文件以更改所需的内容。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons