# 家庭助手插件：Stirling-pdf

这是一个强大且本地托管的基于Web的PDF处理工具，使用Docker构建。它使您能够对PDF文件执行各种操作，包括分割、合并、转换、重组、添加图像、旋转、压缩等。这个本地托管的Web应用程序已经发展成为一个全面的功能集，满足您所有的PDF需求。

Stirling PDF不会发起任何外拨电话用于记录或追踪目的。

所有文件和PDF仅存在于客户端，或仅在任务执行期间驻留在服务器内存中，或暂时驻留在仅用于执行任务的文件中。用户下载的任何文件到那时将已从服务器中删除。

有点占内存。

_感谢所有为我的库打星的人！要打星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![为 @jdeath/homeassistant-addons 的星际观察者库名册](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/Stirling-Tools/Stirling-PDF)。

## 安装

此插件的安装非常简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例中。
1. 安装此插件。750 MB的镜像将需要一些时间来下载。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 打开WebUI应通过<your-ip>:port工作。
1. 设置将位于 /addon_configs/2effc9b9_stirling-pdf。
1. 停止插件，编辑settings.yaml文件以更改您需要的任何内容。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui可在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons