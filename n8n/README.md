# Home assistant 插件: n8n

n8n 是一个可扩展的工作流自动化工具。通过公平代码分发模型，n8n 将始终具有可见的源代码，支持自托管，并允许你添加自己的自定义功能、逻辑和应用程序。n8n 的基于节点的方法使其具有高度的灵活性，使你能够将任何东西连接到任何地方。

功能未经过测试，但插件可以运行

_感谢所有给我的仓库加星的人！要给它加星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/n8n-io/n8n)。

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例中。
1. 点击 `保存` 按钮保存你的配置。
1. 启动插件。
1. 插件将失败，这是正常的
1. 通过 ssh 进入你的 homeassistant，并运行 `chmod 2777 /addon_configs/2effc9b9_n8n`
1. 启动插件
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该可以通过 <your-ip>:port 访问。
1. 设置管理员帐户
1. 设置将位于 /addon_configs/2effc9b9_n8n

## 配置

```
port : 5678 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons