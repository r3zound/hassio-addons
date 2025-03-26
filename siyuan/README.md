# 家庭助理插件：SiYuan

SiYuan 是一个以隐私为首的个人知识管理系统，支持细粒度块级引用和 Markdown 所见即所得。

似乎很受欢迎，但有订阅插件和可选的中国数据中心。请谨慎使用。

_感谢每一个给我仓库点赞的人！要点赞，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker image](https://github.com/siyuan-note/siyuan)。

## 安装

此插件的安装非常简单，与安装其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 设置访问代码和端口。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该通过 <your-ip>:port 来访问。
1. 数据应存放在 /addon_config/2effc9b9_siyuan。
## 配置

```
port : 6806 #您想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons