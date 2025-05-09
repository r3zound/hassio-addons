# Home assistant add-on: EmulatorJS
 网络浏览器基础的仿真，便携到几乎任何设备，适用于许多复古游戏机。混合使用了Libretro和EmulatorJS之间的模拟器。

_感谢所有为我的仓库点赞的人！要点赞，请点击下面的图片，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自linuxserver的[docker镜像](https://github.com/linuxserver/docker-emulatorjs)。网络浏览器基础的仿真，便携到几乎任何设备，适用于许多复古游戏机。混合使用了Libretro和EmulatorJS之间的模拟器。

## 安装

此插件的安装非常简单，与安装其他Hass.io插件没有区别。

1. [将我的Hass.io插件库][repository]添加到你的Hass.io实例。
1. 安装此插件。
1. 点击`保存`按钮以保存你的配置。
1. 创建目录/share/emulatorjs以存储你的游戏/艺术文件。
1. 创建/share/emulatorjs/config和/share/emulatorjs/data。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 将rom放置在/share/emulatorjs/data/EMULATORNAME/roms中的正确文件夹中。
1. 进入管理端口。
1. 点击扫描你为其添加游戏的模拟器。
1. 点击模拟器框，执行步骤1和步骤2。
1. 打开WebUI应进入PlayerUI，访问你的本地homeassistant IP:port或管理端口。
1. 你的游戏应该可用。
1. 查询官方文档获取设置支持：https://github.com/linuxserver/docker-emulatorjs
1. 如果启动插件导致清除你的设置，请停止插件并重启。有时映射到/share/emulatorjs可能不起作用。

## 配置

```
adminport : 3000 #你想在其上运行管理界面的端口。
port: 89 #你想在其上运行前端的端口。
```

Webui可以在`<your-ip>:port`找到。应通过ingress可用。管理端口无法通过ingress访问。

[repository]: https://github.com/jdeath/homeassistant-addons