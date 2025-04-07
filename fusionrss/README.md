# Home assistant 插件: Fusion RSS

一个轻量级的 RSS 源聚合器和阅读器。

主要特性包括：

- 自动分组、书签、搜索、嗅探源
- 导入/导出 OPML 文件
- 支持 RSS、Atom、JSON 类型的源
- 响应式，亮/暗模式，PWA
- 轻量级，自托管友好
  - 使用 Golang 和 SQLite 构建，单个二进制文件部署
  - 预构建的 Docker 镜像
  - 使用约 80MB 的内存
  
_感谢每一个为我的仓库加星的人！要加星，请点击下面的图片，然后它将在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://github.com/0x2E/fusion)。

## 安装

这个插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装这个插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志以查看是否一切正常。
1. WebUI 应该可以通过入口或 <your-ip>:port 访问。
1. 您的数据存储在 /addon_configs/2effc9b9_fusionrss

## 配置

```
port : 8080 # 您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons