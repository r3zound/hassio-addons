# Home assistant 插件: FreeBeeGee

# FreeBeeGee

一个可以在您自己的服务器上托管的虚拟游戏桌面。

您的游戏。您的数据。

## 主要特点

* 基于浏览器的2D虚拟桌面，适用于桌面和角色扮演游戏。
* 易于使用的拖放接口。为高级用户提供键盘快捷键。
* 通过发送房间的唯一URL邀请朋友。房间密码可选。
* 每个房间多个桌子。可用于不同的游戏设置或地下城层级。
* 瓦片/网格基础。支持方形和六边形布局，并具有对齐功能。
* 包含经典游戏板、地下城瓷砖和200多个怪物标记。也可以上传您自己的。
* 为瓷砖、贴纸和标记提供独立图层。
* 用于您的标记/瓷砖的资产浏览器。每个房间/游戏的独立库。
* 便利贴和骰子托盘。
* 模板用于设置桌子和填充您的库。
* 下载您房间的快照/存档，可以在服务器之间转移或保留离线备份。
* 保护隐私。没有用户追踪。没有第三方脚本。房间在一段时间后被删除（可配置），通常为48小时。
* 基于文件和文件夹。不需数据库。易于安装。
* 开源软件（AGPL-3.0）。服务器/API使用PHP编写，客户端使用JavaScript编写。

_感谢所有给我仓库加星的朋友！要加星，请点击下方图像，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker image](https://github.com/ludus-leonis/FreeBeeGee)。

## 安装

此插件的安装相当简单，与安装任何其他Hass.io插件并无不同。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例。
1. 单击`保存`按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开WebUI应能通过<your-ip>:port访问。
1. 设置将位于`/addon_configs/2effc9b9_freebeegee`
1. 网页界面应该提示您设置管理员密码。创建密码并将其粘贴到`/addon_configs/2effc9b9_freebeegee/server.json`中的正确字段
## 配置

```
port : 8080 #您希望运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons