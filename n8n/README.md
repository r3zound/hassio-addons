# 家庭助理附加组件: n8n

n8n 是一个可扩展的工作流自动化工具。通过公平代码分发模型，n8n 将始终具有可见的源代码，能够自我托管，并允许您添加自定义功能、逻辑和应用。n8n 的基于节点的方法使其高度灵活，能够连接任何东西到每个东西。

功能未经过测试，但附加组件确实可以运行

_感谢所有给我的代码库点赞的人！要点赞，请点击下面的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 介绍

此附加组件使用 [docker image](https://github.com/n8n-io/n8n)。

## 安装

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例。
1. 单击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 附加组件将失败，这没关系。
1. 使用 ssh 进入您的 homeassistant，并运行 `chmod 2777 /addon_configs/2effc9b9_n8n`
1. 启动附加组件
1. 检查附加组件的日志以查看是否一切正常。
1. 打开的 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置管理员账户
1. 设置将位于 /addon_configs/2effc9b9_n8n

## 配置

```
port : 5678 #您想要运行的端口。
```

Webui 可在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons