# Home assistant 插件: Livebook

Livebook 是一个用于编写互动和协作代码笔记本的Web应用程序。

_感谢所有给我的仓库加星的朋友们！要加星请点击下面的图片，然后在右上角会有选项。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用了 [docker 镜像](https://github.com/livebook-dev/livebook)。

## 安装

安装此插件非常简单，与安装任何其他Hass.io插件没有区别。

1. 将我的Hass.io插件库添加到你的Hass.io实例。
1. 点击`保存`按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. WebUI 应该可以通过 <your-ip>:port 访问。
1. 数据将保存在 /addon_configs/2effc9b9_livebook 中。
## 配置

```
port : 8080 #你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons