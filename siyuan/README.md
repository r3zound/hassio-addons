# Home assistant 插件: SiYuan

SiYuan 是一个以隐私为首的个人知识管理系统，支持细粒度的块级引用和 Markdown WYSIWYG。

看起来很受欢迎，但有订阅插件和可选的中国数据中心。使用时请谨慎。

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图标，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://github.com/siyuan-note/siyuan)。

## 安装

这个插件的安装相当简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装这个插件。
1. 设置访问码和端口。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 通过 <your-ip>:port 打开 WebUI 应该可以正常工作。
1. 数据应存储在 /addon_config/2effc9b9_siyuan。
## 配置

```
port : 6806 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons