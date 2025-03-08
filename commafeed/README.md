# Home assistant 插件：CommaFeed

受 Google Reader 启发的自托管 RSS 阅读器，基于 Quarkus 和 React/TypeScript。

_感谢所有关注我仓库的人！要关注，请点击下方的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用[docker 镜像](https://github.com/Athou/commafeed/)。

## 安装

此插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository]添加到您的 Hass.io 实例。
1. 点击 `Save` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 打开的 WebUI 应该可以通过 <your-ip>:port 和 ingress 访问。默认用户名：密码是 admin:admin
1. 设置将在 /addon_configs/2effc9b9_commafeed 中。
## 配置

```
port : 8082 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons