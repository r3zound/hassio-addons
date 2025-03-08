# 家庭助理插件：Livebook

Livebook 是一个用于编写互动和协作代码笔记本的 web 应用程序。

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/livebook-dev/livebook)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 单击 `保存` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 通过 <your-ip>:port 应该可以打开 WebUI。
1. 数据将位于 /addon_configs/2effc9b9_livebook。
## 配置

```
port : 8080 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons