# Home Assistant 插件: CommaFeed

受 Google Reader 启发的自托管 RSS 阅读器，基于 Quarkus 和 React/TypeScript。

_感谢所有给我的仓库点过星的人！要点星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/Athou/commafeed/)。

## 安装

安装此插件非常简单，和安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例中。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 打开的 WebUI 应该可以通过 <your-ip>:port 和 ingress 访问。默认用户名:密码是 admin:admin
1. 设置将在 /addon_configs/2effc9b9_commafeed 中。

## 配置

```
port : 8082 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons