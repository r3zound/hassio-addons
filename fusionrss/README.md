# Home assistant 插件：Fusion RSS

一个轻量级的 RSS 订阅聚合器和阅读器。

主要功能包括：

- 自动分组、书签、搜索、嗅探订阅
- 导入/导出 OPML 文件
- 支持 RSS、Atom、JSON 类型的订阅
- 响应式设计、亮暗模式、渐进式 Web 应用
- 轻量级，自托管友好
  - 使用 Golang 和 SQLite 构建，单一二进制文件部署
  - 预构建的 Docker 镜像
  - 消耗约 80MB 内存
  
_感谢所有标记我仓库的朋友！要标记它，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

这个插件基于 [docker 镜像](https://github.com/0x2E/fusion)。

## 安装

安装此插件非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动插件。
1. 检查插件的日志以查看一切是否正常。
1. 打开 WebUI 应该可以通过 ingress 或 <你的-ip>:端口 访问。
1. 你的数据存储在 /addon_configs/2effc9b9_fusionrss

## 配置

```
port : 8080 #你想要运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons