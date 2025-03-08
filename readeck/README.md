# 家庭助手附加组件：Readeck

Readeck 是一个简单的 веб 应用程序，让您保存您喜欢并想要永久保留的网页的可读内容。将其视为书签管理器和稍后阅读工具。

_感谢所有为我的仓库加星的朋友！要加星，请点击下面的图片，然后会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该附加组件基于 [docker 镜像](https://codeberg.org/readeck/readeck)。

## 功能

### 🔖 书签

喜欢你正在阅读的页面吗？将链接粘贴到 Readeck 中，完成！

### 📸 文章、图片和视频

Readeck 为您保存网页的可读内容，以便稍后阅读。它还会检测页面是否为图像或视频，并相应地调整其处理方式。

### ⭐ 标签、收藏、归档

将书签移动到归档或收藏，并添加您想要的任意数量的标签。

### 🖍️ 高亮

高亮您书签中的重要内容，以便稍后轻松找到。

### 🗃️ 收藏集

如果您需要一个专门的部分，其中包含过去两周所有标记为“猫”的书签，Readeck 允许您将此搜索查询保存到收藏集中，以便您可以稍后访问。

### 🧩 浏览器扩展

在浏览时想要稍后保存某些内容吗？无需复制和粘贴链接。安装浏览器扩展，一键保存书签！

- [针对 Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/readeck/)
- [针对 Google Chrome](https://chromewebstore.google.com/detail/readeck/jnmcpmfimecibicbojhopfkcbmkafhee)
- [更多信息和源代码](https://codeberg.org/readeck/browser-extension)

### 📖 电子书导出

还有什么比在电子阅读器上阅读您收集的文章更好的呢？您可以将任何文章导出为电子书文件（EPUB）。您甚至可以将一个集合导出为一本书！

此外，如果您的电子阅读器支持 OPDS，您可以直接从您的电子阅读器访问 Readeck 的目录和收藏。

### 🔎 全文搜索

无论您需要查找来自文章的模糊文本，还是查找所有带有特定标签或来自特定网站的所有文章，我们都可以满足您的需求！

### 🚀 快速！

Readeck 是对被称为乏味但经过验证的技术组件的现代化处理。它保证非常快速的响应时间和流畅的用户体验。

### 🔒 为您的隐私和长期存档而构建

您喜欢的这篇文章明年还会在线吗？10年后呢？也许不会；也许一切都消失，文本和图像都不见了。出于这个原因，以及为了您的隐私，文本和图像在您保存链接的那一刻都会存储在您的 Readeck 实例中。

除了视频之外，从您的浏览器到外部网站没有发出任何请求。

## 安装

1. [将我的 Hass.io 附加组件库][repository] 添加到您的 Hass.io 实例中。
1. 安装该附加组件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动附加组件。
1. 退出附加组件并重新启动（这是第一次必须启动两次！）
1. 检查附加组件的日志，以查看一切是否正常。
1. 通过入口或 <your-ip>:port 打开 WebUI 应该可以工作。

## 更新

由于源代码未托管在 github 上，因此很难自动更新。如果想要最新版本，请发布问题。

## 配置

```
port : 8000 #您要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons