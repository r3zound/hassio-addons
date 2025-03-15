# 家庭助手附加组件：Livebook

Livebook 是一个用于编写交互式和协作代码笔记本的网络应用程序

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图片，然后在右上角即可看到。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个附加组件使用 [docker 镜像](https://github.com/livebook-dev/livebook)。

## 安装

安装此附加组件相当简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件库][repository]添加到您的 Hass.io 实例。
1. 点击 `保存` 按钮以保存您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以查看是否一切正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 数据将位于 /addon_configs/2effc9b9_livebook

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons