# Home assistant 插件：Livebook

Livebook 是一个用于编写互动和协作代码笔记本的 Web 应用程序

_感谢所有为我的仓库点星的人！要为它点星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/livebook-dev/livebook)。

## 安装

安装这个插件非常简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例中。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看所有设置是否正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 数据将位于 /addon_configs/2effc9b9_livebook。
## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons