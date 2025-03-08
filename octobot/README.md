# Home assistant 插件：MeTube

Octobot 是一个强大的开源加密货币交易机器人。

建议仅用于模拟，不要连接到您的交易所，因为尚未测试。不支持 aws、efs、s3fs 和其他功能。

_感谢所有为我的仓库加星的朋友们！要加星，请点击下方的图片，然后它将出现在右上角。谢谢！_

[![为 @jdeath/homeassistant-addons 加星的用户](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://www.octobot.cloud/en/guides/octobot-installation/install-octobot-with-docker-video)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装这个插件。
1. 点击 `Save` 按钮以保存您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. WebUI 应通过入口或 <your-ip>:port 工作。

## 配置

```
port : 5001 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons