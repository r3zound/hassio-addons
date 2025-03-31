# Home assistant add-on: Fusion RSS

一个轻量级的RSS聚合器和阅读器。

主要功能包括：

- 自动分组、书签、搜索、嗅探源
- 导入/导出OPML文件
- 支持RSS、Atom、JSON类型的源
- 响应式设计，轻/暗模式，PWA
- 轻量级，自托管友好
  - 使用Golang和SQLite构建，单个二进制文件部署
  - 预构建的Docker镜像
  - 使用约80MB的内存
  
_感谢所有支持我的仓库的人！要给我仓库加星，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker image](https://github.com/0x2E/fusion)。

## 安装

此插件的安装非常简单，与安装其他Hass.io插件没有不同。

1. [将我的Hass.io插件库][repository]添加到你的Hass.io实例。
1. 安装此插件。
1. 点击`保存`按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. 打开WebUI应该通过ingress或<你的-ip>:端口工作。
1. 你的数据存储在 /addon_configs/2effc9b9_fusionrss

## 配置

```
port : 8080 #你想运行的端口。
```

Webui可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons