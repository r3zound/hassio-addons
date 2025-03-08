# 家庭助手附加组件：备忘录

一个以隐私为优先的轻量级记笔记服务。轻松捕捉和分享你的精彩想法。

从以下地址运行 Docker 镜像： https://github.com/usememos/memos


_感谢每一个给我的仓库加星的人！要加星请点击下面的图片，然后会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)


## 安装

这个附加组件的安装非常简单，与安装其他任何 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository] 添加到你的 Hass.io 实例。
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看一切是否顺利进行。
1. 打开 WebUI 应该可以通过入口或 <你的-ip>:端口 访问。
1. 设置将存储在 /addons-config/2effc9b9_memos

## 配置

```
port : 5230 #你希望运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons