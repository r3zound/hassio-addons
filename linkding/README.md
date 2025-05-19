# Home assistant 插件：linkding

## 介绍
linkding 是一个您可以自托管的书签管理器。
它旨在简约、快速，并且易于使用 Docker 设置。

名称来源于：
- *link*，通常在日常语言中用作 URL 和书签的同义词
- *Ding* 是德语中的“东西”
- ...因此基本上是管理链接的东西

**功能概览：**
- 针对可读性优化的简洁用户界面
- 使用标签组织书签
- 批量编辑、Markdown 笔记、稍后阅读功能
- 与其他用户或访客共享书签
- 自动提供书签网站的标题、描述和图标
- 自动归档网站，可以作为本地 HTML 文件或在互联网档案馆上保存
- 以 Netscape HTML 格式导入和导出书签
- 可安装为渐进式 Web 应用程序 (PWA)
- 为 [Firefox](https://addons.mozilla.org/firefox/addon/linkding-extension/) 和 [Chrome](https://chrome.google.com/webstore/detail/linkding-extension/beakmhbijpdhipnjhnclmhgjlddhidpe) 提供扩展，以及一个书签小工具
- 通过 OIDC 或身份验证代理支持单点登录 (SSO)
- 为开发第三方应用程序提供 REST API
- 用户自助服务和原始数据访问的管理面板

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它就会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/sissbruecker/linkding)。

有点占用内存。此插件使用的是常规的 linkding 镜像，而不是 plus 版本。如果您想使用 plus 版本，请下载插件源代码，放置在 /addons/ 中，编辑 config.json 将版本更改为 latest-plus，而不是版本号。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
2. 安装此插件。
3. 点击“保存”按钮以存储您的配置。
4. 启动插件。
5. 检查插件的日志，查看一切是否顺利。
6. 打开的 WebUI 应通过 <your-ip>:port 工作。
7. 设置将位于 /addon_configs/2effc9b9_linkding
8. 停止插件，编辑 settings.yaml 文件以更改您的需求

## 配置
1. 您必须创建一个初始超级用户帐户。
2. 启动插件
3. 登录到 homeassistant cli
4. `docker ps | grep "link"`，复制显示的第一个 hex 字符串
5. docker exec -it 3c32b108bd10 python manage.py createsuperuser --username=joe --email=joe@mail.com
6. 输入密码，然后重启插件
```
port : 9090 #您希望运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons