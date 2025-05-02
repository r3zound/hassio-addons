# 家庭助手插件：EmulatorJS
 在浏览器中基于网页的仿真，几乎可以移植到任何设备，适用于许多复古游戏机。使用了一种在Libretro和EmulatorJS之间混合的仿真器。
 
_感谢每一个给我的仓库加星的人！要给它加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自linuxserver的[docker镜像](https://github.com/linuxserver/docker-emulatorjs)。在浏览器中基于网页的仿真，几乎可以移植到任何设备，适用于许多复古游戏机。使用了一种在Libretro和EmulatorJS之间混合的仿真器。

## 安装

此插件的安装相当简单，与安装任何其他Hass.io插件没有不同。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例。
1. 安装此插件。
1. 点击`保存`按钮以保存您的配置。
1. 创建目录/share/emulatorjs以存储您的游戏/艺术文件
1. 创建/share/emulatorjs/config和/share/emulatorjs/data
1. 启动插件。
1. 检查插件的日志以查看一切是否顺利。
1. 将rom放入/share/emulatorjs/data/EMULATORNAME/roms中的正确文件夹
1. 转到管理端口
1. 点击扫描您添加游戏的仿真器
1. 点击仿真器框，执行步骤1和步骤2
1. 打开WebUI应该进入PlayerUI，访问您的本地homeassistant IP:port或管理端口。
1. 您的游戏应该可用
1. 请参考官方文档获取安装支持：https://github.com/linuxserver/docker-emulatorjs
1. 如果启动插件导致您的设置被清除，请停止插件并重启。有时映射到/share/emulatorjs不会正常工作

## 配置

```
adminport : 3000 # 您希望在其上运行管理界面的端口。
port: 89 # 您希望在其上运行前端的端口
```

Webui可以在`<your-ip>:port`找到。应可通过入口访问。管理端口不可通过入口访问。

[repository]: https://github.com/jdeath/homeassistant-addons