# 家庭助理插件：Fusion RSS

一个轻量级的RSS聚合器和阅读器。

主要特点包括：

- 自动分组、书签、搜索、嗅探RSS源
- 导入/导出OPML文件
- 支持RSS、Atom、JSON类型的源
- 响应式设计、亮/暗模式、PWA
- 轻量级，适合自托管
  - 基于Golang和SQLite构建，单个二进制文件部署
  - 预构建的Docker镜像
  - 使用约80MB的内存
  
_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于[docker镜像](https://github.com/0x2E/fusion)。

## 安装

这个插件的安装非常简单，与安装任何其他Hass.io插件没有不同。

1. [将我的Hass.io插件仓库][repository]添加到你的Hass.io实例。
1. 安装这个插件。
1. 点击`保存`按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志，查看一切是否正常。
1. 通过ingress或<your-ip>:port打开WebUI应该可以工作。
1. 你的数据存储在 /addon_configs/2effc9b9_fusionrss

## 配置

```
port : 8080 #你希望运行的端口。
```

Webui可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons