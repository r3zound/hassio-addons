# 家庭助手插件：EmulatorJS
基于浏览器的网络模拟，便携到几乎所有设备，支持许多复古游戏机。使用了Libretro和EmulatorJS之间的混合模拟器。

_感谢所有给我仓库加星的人！要加星，点击下面的图片，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于来自linuxserver的[docker镜像](https://github.com/linuxserver/docker-emulatorjs)。基于浏览器的网络模拟，便携到几乎所有设备，支持许多复古游戏机。使用了Libretro和EmulatorJS之间的混合模拟器。

## 安装

此插件的安装相当简单，与安装其他Hass.io插件没有什么不同。

1. [将我的Hass.io插件库][repository]添加到您的Hass.io实例中。
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 创建目录 /share/emulatorjs 用于存储您的游戏/艺术文件。
5. 创建 /share/emulatorjs/config 和 /share/emulatorjs/data。
6. 启动插件。
7. 检查插件的日志以查看一切是否顺利。
8. 将ROM放在 /share/emulatorjs/data/EMULATORNAME/roms 的正确文件夹中。
9. 转到管理端口。
10. 点击扫描您添加了游戏的模拟器。
11. 点击模拟器框，执行步骤1和步骤2。
12. 打开WebUI，应进入PlayerUI，访问您本地的homeassistant IP:port或管理端口。
13. 您的游戏应可用。
14. 查询官方文档以获取设置支持：https://github.com/linuxserver/docker-emulatorjs。
15. 如果启动插件会导致您的设置丢失，请停止插件并重新启动。有时映射到 /share/emulatorjs 并不起作用。

## 配置

```
adminport : 3000 #您希望运行管理界面的端口。
port: 89 #您希望运行前端的端口。
```

Webui可以在 `<your-ip>:port` 找到。应通过ingress可用。管理端口不可通过ingress访问。

[repository]: https://github.com/jdeath/homeassistant-addons