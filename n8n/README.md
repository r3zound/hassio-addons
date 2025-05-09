# 家庭助理附加组件：n8n

n8n 是一个可扩展的工作流自动化工具。通过公平代码发行模式，n8n 将始终提供可见的源代码，允许自托管，并允许您添加自定义函数、逻辑和应用程序。n8n 的基于节点的方法使其高度灵活，能够将任何内容连接到所有内容。

功能尚未测试，但附加组件确实可以运行

_感谢所有给我的仓库点赞的人！要点赞，请单击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该附加组件使用 [docker 镜像](https://github.com/n8n-io/n8n)。

## 安装


1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例中。
1. 单击 `保存` 按钮以保存您的配置。
1. 启动附加组件。
1. 附加组件将失败，这没关系。
1. 通过 SSH 登录到您的 homeassistant 并运行 `chmod 2777 /addon_configs/2effc9b9_n8n`
1. 启动附加组件
1. 检查附加组件的日志以查看一切是否正常。
1. WebUI 应该通过 <your-ip>:port 工作。
1. 设置管理员帐户
1. 设置将在 /addon_configs/2effc9b9_n8n 中。
## 配置

```
port : 5678 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons