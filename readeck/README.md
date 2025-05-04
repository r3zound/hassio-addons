# Home assistant 插件：Readeck

Readeck 是一个简单的网页应用程序，让你可以保存你喜欢并想要永远保留的网页可读内容。将其视为书签管理器和稍后阅读工具。

_感谢每一个为我的仓库点星的人！要点星，请点击下方图片，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

该插件基于 [docker 镜像](https://codeberg.org/readeck/readeck)。

## 特性

### 🔖 书签

喜欢你正在阅读的页面吗？将链接粘贴到 Readeck 中，就完成了！

### 📸 文章、图片和视频

Readeck 为你保存网页的可读内容，以便稍后阅读。它还会检测页面是否为图片或视频，并相应地调整处理方式。

### ⭐ 标签、收藏、归档

将书签移动到归档或收藏夹，并添加你想要的任意多个标签。

### 🖍️ 高亮

高亮书签的重要内容，以便轻松找到它们。

### 🗃️ 集合

如果你需要一个专门的部分，包含过去两周所有标记为“猫”的书签，Readeck 允许你将此搜索查询保存为一个集合，以便稍后访问。

### 🧩 浏览器扩展

想在浏览时保存一些东西以便稍后查看吗？无需复制和粘贴链接。安装浏览器扩展，点击一下即可保存书签！

- [适用于 Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/readeck/)
- [适用于 Google Chrome](https://chromewebstore.google.com/detail/readeck/jnmcpmfimecibicbojhopfkcbmkafhee)
- [更多信息和源代码](https://codeberg.org/readeck/browser-extension)

### 📖 电子书导出

还有什么比在你的电子书阅读器上阅读收集的文章更好的呢？你可以将任何文章导出为电子书文件 (EPUB)。你甚至可以将一个集合导出为一本书！

更重要的是，如果你的电子书阅读器支持 OPDS，你可以直接访问 Readeck 的目录和收藏。

### 🔎 完整文本搜索

无论你需要找到文章中的模糊文本，还是所有带有特定标签或来自特定网站的文章，我们都能满足你的需求！

### 🚀 快速！

Readeck 是对所谓的乏味但经过验证的技术组件的现代解读。它保证了非常快速的响应时间和流畅的用户体验。

### 🔒 为你的隐私和长期存档而构建

你喜欢的这篇文章明年还会在线吗？十年后呢？也许不会；也许一切都消失了，文本和图像都不复存在。为此，以及为了你的隐私，文本和图像在你保存链接的那一刻就会全部存储在你的 Readeck 实例中。

除了视频外，从你的浏览器到外部网站不会发出任何请求。

## 安装

1. [将我的 Hass.io 插件仓库][repository]添加到你的 Hass.io 实例中。
1. 安装此插件。
1. 点击 `Save` 按钮以存储你的配置。
1. 启动插件。
1. 退出插件并重新启动（第一次必须启动两次！）
1. 检查插件的日志以查看是否一切顺利。
1. WebUI 应该可以通过 ingress 或 `<your-ip>:port` 访问。

## 更新
由于源代码不托管在 GitHub 上，自动更新非常困难。如果想要最新版本，请发布问题。

## 配置

```
port : 8000 #你想运行的端口。
```

Webui 可以在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons