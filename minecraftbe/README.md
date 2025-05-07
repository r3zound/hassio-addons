# Home assistant 插件：Minecraft 专用服务器 Bedrock 版
在 Home Assistant 上运行 Minecraft 专用服务器 Bedrock 版的快捷方式。

_感谢所有为我的仓库点星的人！要点星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [itzg/docker-minecraft-bedrock-server](https://github.com/itzg/docker-minecraft-bedrock-server/) 的 Docker 镜像。

每次重启插件时，它会自动获取最新版本的 Minecraft。

你的世界、设置和服务器可执行文件存储在 /share/minecraftbe

你可能想要创建一个服务，在夜间重启插件，以便更新 Minecraft 的版本（见下文）

如果你想在 homeassistant 监控你的 Bedrock 服务器，请安装此集成，因为内置的只监控 Java：https://github.com/jdeath/Bedrock-Homeassistant

## 安装

本插件的安装非常简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
2. 安装此插件。
3. 如有需要，修改 API 端口（默认为标准 Minecraft 端口）
4. 点击 `保存` 按钮以保存你的配置。
5. 创建目录 /share/minecraftbe
6. 启动插件。
7. 检查插件的日志，查看一切是否顺利。
8. 编辑 /share/minecraftbe/ 中的任何服务器/权限/白名单属性，并重启插件。注意，你不能在 server.properties 中更改端口，因为它会出于某种原因被覆盖。然而，你可以在 homeassistant 的插件配置标签中更改端口。我只暴露 IP4 端口。如果需要 IP6，请告诉我。
9. 如果你想要外部访问，请确保将你的外部端口转发到你的 homeassistant IP。

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