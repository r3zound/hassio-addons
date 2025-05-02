# Home assistant add-on: Stirling-pdf

这是一个强大的本地托管基于Web的PDF处理工具，使用Docker。它使您能够对PDF文件进行各种操作，包括拆分、合并、转换、重组、添加图像、旋转、压缩等。这个本地托管的Web应用程序已经发展成一个全面的特性集合，满足您所有的PDF需求。

Stirling PDF 不会发起任何出站电话用于记录或跟踪目的。

所有文件和PDF都仅存在于客户端，或在任务执行期间仅驻留在服务器内存中，或仅为执行任务而临时驻留在文件中。用户下载的任何文件在那时将已从服务器中删除。

有点占用内存。

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker image](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

此插件的安装非常简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例。
1. 安装此插件。750 MB的镜像下载需要一段时间。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 打开WebUI应通过 <your-ip>:port 进行访问。
1. 设置将在 /addon_configs/2effc9b9_stirling-pdf 中。
1. 停止插件，编辑settings.yaml文件以更改您需要的内容。

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons