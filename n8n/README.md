# Home assistant 插件：n8n

n8n 是一个可扩展的工作流自动化工具。通过公平的代码分发模型，n8n 将始终拥有可见的源代码，支持自托管，并允许您添加自己的自定义函数、逻辑和应用程序。n8n 的基于节点的方法使其高度灵活，能够将任何内容连接到所有内容。

功能尚未测试，但插件可以运行

_感谢所有给我的代码库加星的人！要为其加星，请点击下面的图像，然后在右上角查看。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用了 [docker 镜像](https://github.com/n8n-io/n8n)。

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 点击 `保存` 按钮以存储配置。
1. 启动插件。
1. 插件会失败，没关系。
1. ssh 进入您的 homeassistant 并运行 `chmod 2777 /addon_configs/2effc9b9_n8n`
1. 启动插件
1. 检查插件的日志以查看一切是否正常。
1. WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置管理员账户
1. 设置将存储在 /addon_configs/2effc9b9_n8n 下。

## 配置

```
port : 5678 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons