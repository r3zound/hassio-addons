# Home assistant 插件：linkding

## 介绍
linkding 是一个你可以自己托管的书签管理器。
它旨在简约、快速，并便于使用 Docker 设置。

该名称来源于：
- *link* 通常被用作 URL 和书签的同义词
- *Ding* 是德语中“事物”的意思
- ...所以基本上是用来管理你的链接的东西

**功能概述：**
- 针对可读性优化的简洁用户界面
- 使用标签组织书签
- 批量编辑、Markdown 笔记、稍后阅读的功能
- 与其他用户或访客共享书签
- 自动提供书签网站的标题、描述和图标
- 自动归档网站，可以是本地 HTML 文件或互联网档案
- 以 Netscape HTML 格式导入和导出书签
- 可作为渐进式 Web 应用程序 (PWA) 安装
- 为 [Firefox](https://addons.mozilla.org/firefox/addon/linkding-extension/) 和 [Chrome](https://chrome.google.com/webstore/detail/linkding-extension/beakmhbijpdhipnjhnclmhgjlddhidpe) 提供扩展，以及书签小工具
- 通过 OIDC 或认证代理支持单点登录
- 提供 REST API 供开发第三方应用
- 用户自助服务和原始数据访问的管理面板

_感谢所有给我的 repo 点赞的人！要点赞，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/sissbruecker/linkding)。

内存占用较大。此插件使用的是常规的 linkding 镜像，而非 plus 版本。如果你想使用 plus 版本，请下载插件源代码，放在 /addons/ 中，编辑 config.json 将版本改为 latest-plus，而不是版本号。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. 将我的 Hass.io 插件库 [repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `Save` 按钮以保存你的配置。
1. 启动插件。
1. 检查插件的日志以确认一切顺利。
1. WebUI 应通过 <your-ip>:port 访问。
1. 设置将在 /addon_configs/2effc9b9_linkding 中。
1. 停止插件，编辑 settings.yaml 文件以修改你需要的任何设置。

## 配置
1. 你必须先创建一个超级用户账户。
1. 启动插件。
1. 登录到 homeassistant cli。
1. `docker ps | grep "link"`，复制显示的十六进制字符串。
1. docker exec -it 3c32b108bd10 python manage.py createsuperuser --username=joe --email=joe@mail.com
1. 输入密码，然后重启插件。
```
port : 9090 #你希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons