# Home assistant 插件：Leto Reader
**LetoReader** 是一款多功能的快速阅读工具，旨在提高您的阅读效率。它支持高速阅读，适合浏览或轻松阅读的文本，例如每分钟 400-1000 个单词。然而，它也可以在较低的速度下使用，以便更好地理解，同时仍然受益于快速串行视觉呈现（RSVP）。

### 与传统阅读的主要区别
- 固定阅读速度（用户可配置）
- 在更高速度下抑制默读和回退扫视
- 减少眼睛疲劳

### 功能
- 内置分块、节奏和高亮功能
- 优越的用户体验和响应式设计
- 极简的用户界面
- 易于导入
- 可定制（8个设置）
- 专注模式（用于阅读障碍/注意力缺陷/多动症）
- 无外部 API 依赖
- 仅本地存储
- 自由开源软件
- 可自托管

#### 导入选项
- 从 URL
- 上传文件（.pdf, .md, .txt, .html, .epub）
- 剪贴板
- GET 请求的请求体

_感谢所有给我的仓库加星的人！要加星，请点击下面的图像，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件使用 [docker 镜像](https://github.com/Axym-Labs/LetoReader)。

## 安装

此插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 检查插件的日志，看一切是否顺利。

## 配置

```
port : 8080 #您想要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons