# Home assistant add-on: SilverBullet

SilverBullet 是一款为黑客思维的人优化的笔记应用程序。我们都在做笔记。市面上有数以百万计的笔记应用程序。字面上。拥有一个能让你的笔记不仅仅是普通文本文件的应用程序，不是很好吗？你的笔记基本上成为一个你可以查询的数据库；你可以在其上构建自定义知识应用程序？可以说是一个可黑客化的笔记本？

_感谢每一个给我的仓库点星的人！要点星，请点击下方的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker image](https://github.com/silverbulletmd/silverbullet)。

## 安装

这个插件的安装非常简单，和安装任何其他的 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装这个插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 如果你想要密码保护，将 SB_HOME 字段设置为 UserName:Password，例如 Mike:Pass123。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该通过 ingress 或 <your-ip>:port 工作。
1. 数据应存储在 /addon_config/2effc9b9_silverbullet 中。

## 配置

```
port : 8081 #你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons