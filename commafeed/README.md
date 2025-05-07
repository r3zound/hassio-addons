# Home assistant add-on: CommaFeed

受Google Reader启发的自托管RSS阅读器，基于Quarkus和React/TypeScript。

_感谢所有为我的代码库加星的人！要为其加星，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用了[docker镜像](https://github.com/Athou/commafeed/)。

## 安装

安装这个插件非常简单，与安装任何其他Hass.io插件没有不同。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例。
1. 点击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志，以查看一切是否顺利。
1. 打开WebUI应可以通过<your-ip>:port和ingress访问。默认用户:密码是admin:admin
1. 设置将位于/addon_configs/2effc9b9_commafeed

## 配置

```
port : 8082 #您想要运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons