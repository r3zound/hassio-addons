# Home Assistant 插件：Readeck

Readeck 是一个简单的 web 应用程序，可让您保存您喜欢的网页中的珍贵可读内容，并希望永远保留这些内容。将其视为书签管理器和稍后阅读工具。

_感谢所有给我的仓库点亮星星的人！要点亮它，请点击下方的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此插件基于 [docker 镜像](https://codeberg.org/readeck/readeck)。

## 功能

### 🔖 书签

喜欢您正在阅读的页面吗？将链接粘贴到 Readeck 中，您就完成了！

### 📸 文章、图片和视频

Readeck 为您保存网页的可读内容，以便您稍后阅读。它还会检测页面是否为图像或视频，并相应地调整其处理方式。

### ⭐ 标签、收藏、档案

将书签移动到档案或收藏，并根据需要添加任意数量的标签。

### 🖍️ 高亮

高亮您的书签中的重要内容，以便稍后轻松找到。

### 🗃️ 收藏夹

如果您需要一个专门的部分，保存过去两周所有标记为“猫”的书签，Readeck 允许您将此搜索查询保存到一个收藏夹中，以便您稍后访问。

### 🧩 浏览器扩展

想在浏览网页时稍后保存某些内容吗？无需复制和粘贴链接。安装浏览器扩展，单击即可保存书签！

- [适用于 Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/readeck/)
- [适用于 Google Chrome](https://chromewebstore.google.com/detail/readeck/jnmcpmfimecibicbojhopfkcbmkafhee)
- [更多信息和源代码](https://codeberg.org/readeck/browser-extension)

### 📖 电子书导出

还有什么比在电子阅读器上阅读您收集的文章更好的呢？您可以将任何文章导出为电子书文件（EPUB）。您甚至可以将一个收藏导出为一本书！

此外，您可以直接从支持 OPDS 的电子阅读器访问 Readeck 的目录和收藏。

### 🔎全文搜索

无论您需要从文章中找到一段模糊的文本，还是寻找带有特定标签或来自特定网站的所有文章，我们都能满足您的需求！

### 🚀 快速！

Readeck 以现代的方式对所谓的无聊但经过验证的技术进行重新阐释。它保证非常快速的响应时间和顺畅的用户体验。

### 🔒 为您的隐私和长期归档而构建

您喜欢的这篇文章明年还会在线吗？十年后呢？也许不会；也许所有内容都消失了，文本和图像也是。因此，为了这个原因，以及您的隐私，文本和图像在您保存链接的那一刻都会存储在您的 Readeck 实例中。

除了视频以外，从您的浏览器向外部网站发出的请求不会发生。

## 安装

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `Save` 按钮以存储您的配置。
1. 启动插件。
1. 退出插件并重新启动（第一次启动时需要这样做两次！）
1. 检查插件的日志以查看一切是否顺利。
1. WebUI 应该可以通过入口或 <your-ip>:port 访问。

## 更新

由于源代码未托管在 GitHub 上，因此很难自动更新此内容。如需最新版本，请提交问题。

## 配置

```
port : 8000 #您要运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons