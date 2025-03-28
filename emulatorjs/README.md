# Home assistant 插件：EmulatorJS
基于浏览器的模拟器，便携式，适用于几乎所有设备，支持多种复古控制台。结合了Libretro和EmulatorJS的多种模拟器。

_感谢所有给我的repo点星的人！要点星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于来自linuxserver的[docker镜像](https://github.com/linuxserver/docker-emulatorjs)。基于浏览器的模拟器，便携式，适用于几乎所有设备，支持多种复古控制台。结合了Libretro和EmulatorJS的多种模拟器。

## 安装

这个插件的安装相当简单，与安装其他Hass.io插件没有不同。

1. [将我的Hass.io插件库][repository]添加到你的Hass.io实例中。
2. 安装此插件。
3. 点击`保存`按钮以保存配置。
4. 创建目录/share/emulatorjs以存储游戏/艺术文件。
5. 创建/share/emulatorjs/config和/share/emulatorjs/data。
6. 启动插件。
7. 检查插件的日志，看看一切是否正常。
8. 将rom文件放置在/share/emulatorjs/data/EMULATORNAME/roms的正确文件夹中。
9. 转到管理端口。
10. 点击扫描你为其添加游戏的模拟器。
11. 点击模拟器框，执行步骤1和步骤2。
12. 打开WebUI应该会进入PlayerUI，访问你的本地homeassistant IP:port或管理端口。
13. 你的游戏应该可用。
14. 查阅官方文档以获取设置支持：https://github.com/linuxserver/docker-emulatorjs
15. 如果启动插件导致清除你的设置，请停止插件，并重新启动。有时映射到/share/emulatorjs不起作用。

## 配置

```
adminport : 3000 #你想要运行管理界面的端口。
port: 89 #你想要运行前端的端口。
```

Webui可以在`<你的-ip>:端口`找到。应该可以通过ingress访问。管理端口无法通过ingress访问。

[repository]: https://github.com/jdeath/homeassistant-addons