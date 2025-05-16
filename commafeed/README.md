# 家庭助手插件：CommaFeed

基于 Quarkus 和 React/TypeScript 的自托管 RSS 阅读器，灵感来源于 Google Reader。

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件使用 [docker 镜像](https://github.com/Athou/commafeed/)。

## 安装

安装此插件非常简单，与安装其他任何 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开 WebUI 应通过 <your-ip>:port 和 ingress 访问。默认用户:密码为 admin:admin
1. 设置将在 /addon_configs/2effc9b9_commafeed 中

## 配置

```
port : 8082 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons