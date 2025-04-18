# Home assistant 插件：EmulatorJS
基于浏览器的仿真便携可用于几乎任何设备，适用于许多复古控制台。使用了Libretro和EmulatorJS之间的多种仿真器混合。

_感谢所有给我的仓库点赞的人！想要点赞请点击下方的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自linuxserver的[docker镜像](https://github.com/linuxserver/docker-emulatorjs)。基于浏览器的仿真便携可用于几乎任何设备，适用于许多复古控制台。使用了Libretro和EmulatorJS之间的多种仿真器混合。

## 安装

此插件的安装非常简单，与安装其他Hass.io插件没有不同。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例。
1. 安装此插件。
1. 点击`保存`按钮以存储您的配置。
1. 创建目录/share/emulatorjs以存储您的游戏/艺术文件。
1. 创建/share/emulatorjs/config和/share/emulatorjs/data。
1. 启动插件。
1. 检查插件的日志，查看是否一切正常。
1. 将rom文件放置在/share/emulatorjs/data/EMULATORNAME/roms中的正确文件夹。
1. 进入管理端口。
1. 点击扫描您添加了游戏的仿真器。
1. 点击仿真器框，执行步骤1和步骤2。
1. 打开WebUI，应该进入PlayerUI，访问您的本地homeassistant IP:port或管理端口。
1. 您的游戏应该可用。
1. 请查阅官方文档以获取安装支持：https://github.com/linuxserver/docker-emulatorjs
1. 如果启动插件导致清除您的设置，请停止插件并重启。有时映射到/share/emulatorjs可能不工作。

## 配置

```
adminport : 3000 #您希望运行管理界面的端口。
port: 89 #您希望运行前端的端口。
```

Webui可以在`<your-ip>:port`找到。应该可以通过ingress访问。管理端口无法通过ingress访问。

[repository]: https://github.com/jdeath/homeassistant-addons