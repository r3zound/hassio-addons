# 家助手插件：Fusion RSS

一个轻量级的RSS订阅聚合器和阅读器。

主要功能包括：

- 自动分组、书签、搜索、嗅探订阅源
- 导入/导出OPML文件
- 支持RSS、Atom、JSON类型的订阅源
- 响应式设计，支持亮/暗模式，PWA
- 轻量级，自托管友好
  - 使用Golang和SQLite构建，部署只需一个二进制文件
  - 预构建的Docker镜像
  - 大约使用80MB的内存
  
_感谢所有为我的仓库点赞的人！要点赞，请点击下面的图片，然后它会显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker镜像](https://github.com/0x2E/fusion)。

## 安装

此插件的安装相当简单，与安装任何其他Hass.io插件没有区别。

1. [将我的Hass.io插件仓库][repository]添加到您的Hass.io实例中。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以确保一切正常。
1. 打开WebUI，应该可以通过入口或者<你的-ip>:port访问。
1. 您的数据存储在 /addon_configs/2effc9b9_fusionrss

## 配置

```
port : 8080 #您希望运行的端口。
```

Webui可以在 `<你的-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons