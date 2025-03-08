# 家庭助手插件：PlanarAlly

# PlanarAlly

当你踏入平面时的伴随工具。

PlanarAlly 是一个网络工具，可以为你的 TTRPG/D&D 工具箱添加带有各种额外功能的虚拟战斗地图。

一些关键特性包括：

**自我托管**：你可以在任何地方运行此软件，而无需依赖外部服务\
**离线支持**：该工具可以在完全离线的设置中使用，适合你在黑暗地牢中进行 D&D 游戏。

**简单图层**：将场景组织在图层中以便于管理。\
**无限画布**：当有限的工作空间仍然不够时！\
**动态照明**：通过使用光和阴影来增强沉浸感。\
**玩家视角**：将视角限制在你的令牌所能看到的范围内。如果你的伙伴在不同的房间，你就看不到光！\
**主动权追踪器**：简单的主动权追踪器\
**楼层！**：当站在阳台上时，可以俯瞰下层楼！

这个工具是免费使用的，并且是开源的。


_感谢所有给我的仓库星标的人！要给它星标，请点击下方的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/Kruptein/PlanarAlly)。

## 安装

此插件的安装需要几个额外步骤。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 它会失败，这没关系
1. 设置将在`/addon_configs/2effc9b9_plannarally`中
1. 通过 ssh 登录到 homeassistant，输入 `chmod 2777 addon_configs/2effc9b9_plannarally`
2. 启动插件，它会启动，但随后会停止插件。
1. 编辑 `/addon_configs/2effc9b9_plannarally/server_config.cfg`
1. 在 `[General]` 下添加以下两行：

```
save_file = /config/planar.sqlite
assets_directory = /config/assets
```
1. 重启插件
1. 打开 WebUI，应通过 <your-ip>:port 工作。

## 配置

```
port : 8080 #你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons