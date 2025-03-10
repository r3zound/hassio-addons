# Home Assistant 插件: MeTube

Octobot 是一个强大的开源加密货币交易机器人。

建议您仅用于模拟，不要连接到您的交易所，因为未经过测试。 不支持 aws、efs、s3fs 和其他东西。


_感谢所有给我的仓库加星的人！要加星，请点击下方图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件基于 [docker 镜像](https://www.octobot.cloud/en/guides/octobot-installation/install-octobot-with-docker-video)。

## 安装

这个插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志，以查看一切是否顺利。
1. WebUI 应该可以通过入口或 <你的-ip>:端口 访问。

## 配置

```
port : 5001 # 您希望运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons