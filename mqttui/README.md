# Home Assistant 插件：mqqtui

MQTT Web Interface 是一个开源的Web应用程序，提供MQTT（消息队列遥测传输）消息流的实时可视化。它允许用户监视MQTT主题、发布消息并通过直观的Web界面查看消息统计信息。

_感谢所有给我的仓库加星的人！要加星，请点击下方图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://github.com/terdia/mqttui)。

## 安装

这个插件的安装非常简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件仓库][repository]添加到你的Hass.io实例中。
1. 安装这个插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件日志，查看一切是否正常。
1. 通过 `<your-ip>:port` 打开WebUI。

## 配置

```
port : 5000 #你想运行的端口。
```

Webui可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons