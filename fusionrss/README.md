# 家庭助手附加组件：Fusion RSS

一个轻量级的RSS订阅聚合阅读器。

主要功能包括：

- 自动分组、书签、搜索、嗅探订阅源
- 导入/导出OPML文件
- 支持RSS、Atom、JSON类型的订阅源
- 响应式设计、明暗模式、PWA
- 轻量级、适合自托管
  - 使用Golang和SQLite构建，单一二进制文件部署
  - 预构建的Docker镜像
  - 大约使用80MB内存

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它将显示在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件基于[docker镜像](https://github.com/0x2E/fusion)。

## 安装

此附加组件的安装非常简单，与安装其他Hass.io附加组件没有区别。

1. [将我的Hass.io附件库][repository]添加到您的Hass.io实例中。
1. 安装此附加组件。
1. 点击`保存`按钮以存储您的配置。
1. 启动附加组件。
1. 检查附加组件的日志以确认一切正常。
1. 通过ingress或<your-ip>:port访问WebUI。
1. 您的数据存储在 /addon_configs/2effc9b9_fusionrss中。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui可以在`<your-ip>:port`找到。

[repository]: https://github.com/jdeath/homeassistant-addons