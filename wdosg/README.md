# Home assistant 插件: wDOSg

wDOSg (网页 DOS 游戏) 是一个集中式的 DOS 游戏库，允许您从 IGDB 获取元数据，并通过 js-dos 在浏览器中运行您的游戏，使用精简的配置。

_感谢每位在我的仓库上点星的人！要点赞，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/SoulRaven80/wdosg)。

## 安装

此插件的安装需要一些额外的工作。
1. 查阅官方 [仓库](https://github.com/SoulRaven80/wdosg)
1. 获取一个 Twitch 开发者账户 [说明](https://api-docs.igdb.com/#account-creation)。
1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 单击 `保存` 按钮以存储您的配置。
1. 此插件需要 CLIENT_ID 和 SECRET。它会为您获取令牌。
1. 启动插件。
1. 检查插件的日志，查看是否一切顺利。
1. 打开 WebUI 应该可以通过 <您的-IP>:端口 访问
1. 默认用户名/密码 = wdosg@wdosg.com / wdosg
1. 查阅官方文档以制作 jsdos 包。这个过程有点麻烦！最新版本可以直接从您的游戏 zip 压缩包中实现。确保压缩文件的根目录直接包含游戏，而不是在压缩包内的文件夹中！
1. 上传您的包并玩您的游戏。
1. 设置将位于 /addon_configs/2effc9b9_wdosg
## 配置

```
port : 3001 #您希望运行的端口。
```

Webui 可以在 `<您的-IP>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons