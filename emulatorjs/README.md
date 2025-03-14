# Home assistant 组件: EmulatorJS
基于浏览器的网络模拟，适用于几乎所有设备的许多复古游戏机。使用了 Libretro 和 EmulatorJS 之间的多种模拟器混合。

_感谢所有给我的仓库点星的人！要点星，请点击下面的图片，之后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自 linuxserver 的 [docker 镜像](https://github.com/linuxserver/docker-emulatorjs)。基于浏览器的网络模拟，适用于几乎所有设备的许多复古游戏机。使用了 Libretro 和 EmulatorJS 之间的多种模拟器混合。

## 安装

此插件的安装相当简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库添加][repository]到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以保存您的配置。
1. 创建目录 /share/emulatorjs 用于存储您的游戏/艺术文件。
1. 创建 /share/emulatorjs/config 和 /share/emulatorjs/data。
1. 启动插件。
1. 检查插件的日志以确认一切正常。
1. 将 roms 放置在 /share/emulatorjs/data/EMULATORNAME/roms 中的正确文件夹中。
1. 访问管理端口。
1. 点击扫描您添加了游戏的模拟器。
1. 点击模拟器框，执行步骤 1 和步骤 2。
1. 打开 WebUI 应该会转入 PlayerUI，访问您的本地主机 IP:端口或管理端口。
1. 您的游戏应该是可用的。
1. 查阅官方文档以获取设置支持: https://github.com/linuxserver/docker-emulatorjs。
1. 如果启动插件导致您的设置被清除，停止插件，并重新启动。有时映射到 /share/emulatorjs 可能无法正常工作。

## 配置

```
adminport : 3000 #您想要运行管理界面的端口。
port: 89 #您想要运行前端的端口
```

Webui 可以在 `<您的-ip>:端口` 找到。应该可以通过 ingress 访问。管理端口无法通过 ingress 访问。

[repository]: https://github.com/jdeath/homeassistant-addons