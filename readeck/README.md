# Home assistant 组件：Readeck

Readeck 是一个简单的网络应用程序，让您保存您喜欢的网页的宝贵可读内容，并希望永久保留。把它看作是一个书签管理器和稍后阅读工具。

_感谢每一个给我的仓库打星的人！要打星，请点击下面的图像，然后它将在右上角显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此组件基于 [docker 镜像](https://codeberg.org/readeck/readeck)。

## 特性

### 🔖 书签

喜欢您正在阅读的页面吗？将链接粘贴到 Readeck 中，您就完成了！

### 📸 文章、图片和视频

Readeck 为您保存网页的可读内容，以便您稍后阅读。它还会检测页面是否为图像或视频，并相应地调整其处理方式。

### ⭐ 标签、收藏、档案

将书签移动到档案或收藏，并添加任意数量的标签。

### 🖍️ 高亮

突出显示书签中的重要内容，以便您可以轻松找到它。

### 🗃️ 收藏夹

如果您需要一个专门的部分，包含过去两周内所有标记为“猫”的书签，Readeck 允许您将此搜索查询保存到收藏夹中，以便稍后访问。

### 🧩 浏览器扩展

在浏览时想要保留某些内容以备后用？无需复制和粘贴链接。安装浏览器扩展，一键保存书签！

- [适用于Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/readeck/)
- [适用于Google Chrome](https://chromewebstore.google.com/detail/readeck/jnmcpmfimecibicbojhopfkcbmkafhee)
- [更多信息和源代码](https://codeberg.org/readeck/browser-extension)

### 📖 电子书导出

还有什么比在电子书阅读器上阅读您收集的文章更好的呢？您可以将任何文章导出为电子书文件（EPUB）。您甚至可以将一个收藏导出为一本书！

更重要的是，如果您的电子阅读器支持 OPDS，您可以直接访问 Readeck 的目录和收藏夹。

### 🔎 全文搜索

无论您需要查找一篇文章中的模糊文本，还是查找所有带有特定标签或来自特定网站的文章，我们都能满足您的需求！

### 🚀 快速！

Readeck 是对所谓无聊但经过验证的技术的现代演绎。它保证非常快的响应时间和流畅的用户体验。

### 🔒 为您的隐私和长期存档而建立

您喜欢的这篇文章明年还会在线吗？10年后呢？也许不会；也许它会消失，文本和图像都会消失。因此，为了您的隐私，文本和图像在您保存链接的那一刻都存储在您的 Readeck 实例中。

除了视频外，您的浏览器不会发出任何请求到外部网站。

## 安装

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 启动插件。
1. 退出插件并重新启动（第一次启动时需要这样做两次！）
1. 检查插件的日志以查看是否一切正常。
1. 打开 WebUI 应该能通过进入或 <your-ip>:port 访问。

## 更新
由于源代码不是托管在 Github 上，因此很难自动更新。若想要最新版本，请提交问题。

## 配置

```
port : 8000 #您希望运行的端口。
```

Webui 可在 `<your-ip>:port` 找到。

[repository]: https://github.com/jdeath/homeassistant-addons