# Home Assistant 附加组件：Minecraft 专用服务器基岩版
在 Home Assistant 上运行 Minecraft 专用服务器基岩版的快速方法。

_感谢每一个为我的仓库点星的人！要为它点星，请点击下面的图像，然后它将位于右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [itzg/docker-minecraft-bedrock-server](https://github.com/itzg/docker-minecraft-bedrock-server/) docker 镜像。

当重新启动附加组件时，它将自动获取最新版本的 Minecraft。

您的世界、设置和服务器可执行文件存储在 /share/minecraftbe

您可能想要创建一个服务，在半夜重新启动附加组件，以便更新 Minecraft 版本（见下文）。

如果您想在 Home Assistant 中监控您的基岩服务器，请安装此集成，因为内置的只监控 Java： https://github.com/jdeath/Bedrock-Homeassistant

## 安装

此附加组件的安装非常简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此附加组件。
2. 如果需要，修改 API 端口（默认为标准 Minecraft 端口）。
3. 单击 `保存` 按钮以存储您的配置。
4. 创建目录 /share/minecraftbe
5. 启动附加组件。
6. 检查附加组件的日志以查看一切是否顺利。
7. 编辑 /share/minecraftbe/ 中您想要的任何服务器/权限/白名单属性并重启附加组件。请注意，您不能在 server.properties 中更改端口，因为它将被某些原因覆盖。不过，您可以在 Home Assistant 的附加组件配置选项卡中更改端口。我只暴露了 IPv4 端口。如果需要 IPv6，请告诉我。
8. 如果您想要外部访问，请确保将您的外部端口转发到您的 Home Assistant IP。

## 重启自动化

```
alias: Restart Minecraft Server
description: ""
trigger:
  - platform: time
    at: "02:00:00"
condition:
  - condition: time
    before: "00:00:00"
    weekday:
      - mon
      - wed
      - fri
    after: "00:00:00"
action:
  - service: hassio.addon_restart
    data:
      addon: 2effc9b9-minecraftbe
mode: single
```
[repository]: https://github.com/jdeath/homeassistant-addons