# 家庭助理插件：SiYuan

SiYuan 是一个隐私优先的个人知识管理系统，支持细粒度的块级引用和Markdown所见即所得。

看起来很受欢迎，但有订阅附加功能和可选的中国数据中心。请谨慎使用。

_感谢所有给我仓库加星的人！想要加星请点击下面的图片，然后会在右上方显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker image](https://github.com/siyuan-note/siyuan)。

## 安装

这个插件的安装非常简单，与安装其他Hass.io插件没有区别。

1. [将我的Hass.io插件库][repository]添加到你的Hass.io实例。
1. 安装这个插件。
1. 设置访问代码和端口。
1. 点击`保存`按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开WebUI应通过<your-ip>:port访问。
1. 数据应存储在 /addon_config/2effc9b9_siyuan 中。

## 配置

```
port : 6806 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons