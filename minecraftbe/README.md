# 家庭助手附加组件：Minecraft 专用服务器基岩版
在家庭助手上运行 Minecraft 专用服务器基岩版的快捷方式。

_感谢所有给我的仓库加星的人！要加星，请点击下面的图像，然后它将显示在右上方。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件使用 [itzg/docker-minecraft-bedrock-server](https://github.com/itzg/docker-minecraft-bedrock-server/) docker 镜像。

重新启动附加组件时，它将自动获取最新版本的 Minecraft。

您的世界、设置和服务器可执行文件存储在 /share/minecraftbe

您可能想要创建一个服务在半夜重新启动附加组件，以便更新 Minecraft 版本（见下文）

如果您想在家庭助手中监控您的基岩服务器，请安装此集成，因为内置的仅监控 Java 版：https://github.com/jdeath/Bedrock-Homeassistant

## 安装

此附加组件的安装非常简单，与安装其他 Hass.io 附加组件没有区别。

1. [将我的 Hass.io 附加组件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此附加组件。
2. 如果需要，请更改 API 端口（默认为标准 Minecraft 端口）
3. 单击 `保存` 按钮以存储您的配置。
4. 创建目录 /share/minecraftbe
5. 启动附加组件。
6. 检查附加组件的日志以查看是否一切正常。
7. 编辑您想要的 /share/minecraftbe/ 中的任何服务器/权限/白名单属性并重新启动附加组件。请注意，您无法在 server.properties 中更改端口，因为它会被覆盖。但您可以在家庭助手中的附加组件配置选项卡中更改端口。我只暴露 IP4 端口。如果需要 IP6，请告诉我。
8. 如果您想要外部访问，请确保将您的外部端口转发到您的家庭助手 IP。

## 重启自动化

```
alias: 重启 Minecraft 服务器
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