# Home assistant 插件：EmulatorJS
基于浏览器的模拟运行，可移植到几乎任何设备上，适用于许多复古游戏机。使用了Libretro和EmulatorJS之间的混合模拟器。

_感谢所有给我的代码库点赞的人！要点赞，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自linuxserver的[docker镜像](https://github.com/linuxserver/docker-emulatorjs)。基于浏览器的模拟运行，可移植到几乎任何设备上，适用于许多复古游戏机。使用了Libretro和EmulatorJS之间的混合模拟器。

## 安装

此插件的安装相当简单，与安装任何其他Hass.io插件没有不同。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 创建目录 /share/emulatorjs 来存储您的游戏/艺术文件。
1. 创建 /share/emulatorjs/config 和 /share/emulatorjs/data。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 将rom放入/share/emulatorjs/data/EMULATORNAME/roms中的正确文件夹。
1. 转到管理端口。
1. 点击扫描您添加游戏的模拟器。
1. 点击模拟器框，执行步骤1和步骤2。
1. 打开WebUI，将进入PlayerUI，访问您的本地主机IP:端口或管理端口。
1. 您的游戏应该可以使用。
1. 查阅官方文档以获得设置支持：https://github.com/linuxserver/docker-emulatorjs
1. 如果启动插件导致您的设置被清除，请停止插件并重启。有时映射到/share/emulatorjs可能不工作。

## 配置

```
adminport : 3000 #您希望管理界面运行的端口。
port: 89 # 您希望前端运行的端口
```

Webui可以在`<your-ip>:port`找到。应通过入口访问。管理端口不能通过入口访问。

[repository]: https://github.com/jdeath/homeassistant-addons