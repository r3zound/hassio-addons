# Home assistant 插件: SiYuan

SiYuan 是一个以隐私为首的个人知识管理系统，支持细粒度块级引用和 Markdown WYSIWYG。

看起来很受欢迎，但有订阅插件和可选的中国数据中心。使用时请小心。

_感谢所有给我仓库点星的人！要点星请点击下方图片，然后在右上角找到。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker 镜像](https://github.com/siyuan-note/siyuan)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository]添加到您的 Hass.io 实例。
1. 安装此插件。
1. 设置访问代码和端口
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 数据应存储在 /addon_config/2effc9b9_siyuan 中。
## 配置

```
port : 6806 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons