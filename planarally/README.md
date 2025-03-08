# Home assistant 插件: PlanarAlly

# PlanarAlly

一个在你旅行到不同平面时的辅助工具。

PlanarAlly 是一个网页工具，为你的 TTRPG/D&D 工具箱添加虚拟战斗地图以及各种附加功能。

一些关键特性包括：

**自我托管**：你可以在任何地方运行这个软件，而无需依赖外部服务\
**离线支持**：这个工具可以在完全离线的环境中使用，适合在黑暗地牢中玩 D&D。

**简单图层**：将你的场景按图层进行组织，以便于管理。\
**无限画布**：当有限的工作空间仍然不够时！\
**动态光照**：通过运用光与影来增强沉浸感。\
**玩家视野**：将视野限制在你的棋子能看到的范围内。如果你的同伴在另一个房间，你就看不到光亮！\
**先攻追踪器**：简单的先攻追踪器\
**楼层！**：在阳台上俯视下层楼！

这个工具可以免费使用，并且是开源的。


_感谢所有给我的仓库点赞的人！要点赞，请点击下面的图片，然后在右上角即可。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用了 [docker 镜像](https://github.com/Kruptein/PlanarAlly)。

## 安装

安装此插件需要几个额外步骤。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 它会失败，这没关系。
1. 设置将在 `/addon_configs/2effc9b9_plannarally` 中。
1. SSH 进入 homeassistant，输入 `chmod 2777 addon_configs/2effc9b9_plannarally`
2. 启动插件，它会启动，但之后会停止插件。
1. 编辑 `/addon_configs/2effc9b9_plannarally/server_config.cfg`
1. 在 `[General]` 下添加以下两行：

```
save_file = /config/planar.sqlite
assets_directory = /config/assets
```
1. 重启插件
1. 打开 WebUI，应该可以通过 <your-ip>:port 访问。

## 配置

```
port : 8080 #你想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons