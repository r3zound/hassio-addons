# Home assistant add-on: EmulatorJS
 在浏览器中基于网络的仿真，便携到几乎任何设备，适用于许多复古游戏机。使用了 Libretro 和 EmulatorJS 之间的混合仿真器。
 
_感谢所有给我的仓库加星的朋友们！要加星，请单击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自 linuxserver 的 [docker 镜像](https://github.com/linuxserver/docker-emulatorjs)。在浏览器中基于网络的仿真，便携到几乎任何设备，适用于许多复古游戏机。使用了 Libretro 和 EmulatorJS 之间的混合仿真器。

## 安装

此插件的安装相当简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例中。
1. 安装此插件。
1. 点击 `Save` 按钮以保存您的配置。
1. 创建目录 /share/emulatorjs 来存储您的游戏/艺术文件
1. 创建 /share/emulatorjs/config 和 /share/emulatorjs/data
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 将 ROM 放入 /share/emulatorjs/data/EMULATORNAME/roms 中的正确文件夹
1. 转到管理端口
1. 点击扫描您添加游戏的仿真器
1. 点击仿真器框，执行步骤 1 和步骤 2
1. 打开 WebUI 应该进入 PlayerUI，转到您的本地 homeassistant IP:port 或管理端口。
1. 您的游戏应该可用
1. 查阅官方文档以获取设置支持： https://github.com/linuxserver/docker-emulatorjs
1. 如果启动插件导致您的设置被清除，请停止插件并重新启动。有时映射到 /share/emulatorjs 不会工作

## 配置

```
adminport : 3000 # 您希望运行管理界面的端口。
port: 89 # 您希望运行前端的端口
```

Webui 可以在 `<your-ip>:port` 找到。应通过入口可用。管理端口不可通过入口访问。

[repository]: https://github.com/jdeath/homeassistant-addons