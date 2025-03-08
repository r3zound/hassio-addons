# Home Assistant 插件：linkding

## 介绍
linkding 是一个书签管理器，您可以自行托管。
它的设计旨在简约、快速，并且易于使用 Docker 设置。

它的名称来源于：
- *link*，在日常用语中常用作 URL 和书签的同义词
- *Ding* 是德语中“物品”的意思
- ...所以基本上就是用来管理您的链接的东西

**功能概述：**
- 经过优化的清晰 UI，方便阅读
- 使用标签组织书签
- 批量编辑、Markdown 笔记、稍后阅读功能
- 与其他用户或访客共享书签
- 自动提供书签网站的标题、描述和图标
- 自动归档网站，可以是本地 HTML 文件或在互联网档案馆上
- 以 Netscape HTML 格式导入和导出书签
- 可安装为渐进式 Web 应用程序 (PWA)
- 提供 [Firefox](https://addons.mozilla.org/firefox/addon/linkding-extension/) 和 [Chrome](https://chrome.google.com/webstore/detail/linkding-extension/beakmhbijpdhipnjhnclmhgjlddhidpe) 的扩展，以及书签工具
- 通过 OIDC 或身份验证代理支持 SSO
- 提供用于开发第三方应用程序的 REST API
- 管理面板供用户自助服务和原始数据访问

_感谢所有为我的仓库点赞的人！要点赞，请点击下方图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件使用 [docker 镜像](https://github.com/sissbruecker/linkding)。

有点占用内存。它使用常规的 linkding 镜像，而不是 plus。如果您想使用 plus，请下载插件源代码，放置在 /addons/ 中，编辑 config.json 将版本更改为 latest-plus 而不是版本号。

## 安装

安装这个插件非常简单，与安装其他 Hass.io 插件没有什么不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. WebUI 应该可以通过 <您的 IP>:端口 访问。
1. 设置将保存在 /addon_configs/2effc9b9_linkding 中。
1. 停止插件，编辑 settings.yaml 文件以更改您需要的任何内容。

## 配置
1. 您必须创建一个初始超级用户账户。
1. 启动插件。
1. 登录到 homeassistant cli。
1. `docker ps | grep "link"`，复制显示的第一个十六进制字符串。
1. docker exec -it 3c32b108bd10 python manage.py createsuperuser --username=joe --email=joe@mail.com。
1. 输入密码，然后重启插件。
```
port : 9090 #您希望运行的端口。
```

Webui 可以在 `<您的 IP>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons