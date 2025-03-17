# 家庭助手附加组件: Readeck

Readeck 是一个简单的 web 应用程序，让你可以保存你喜欢的网页中的珍贵可读内容，并希望永久保留。将其视为书签管理器和稍后阅读工具。

_感谢每一个给我的 repos 点星的人！要点星，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关于

此附加组件基于 [docker 镜像](https://codeberg.org/readeck/readeck)。

## 特性

### 🔖 书签

喜欢你正在阅读的页面吗？将链接粘贴到 Readeck 中，操作完成！

### 📸 文章、图片和视频

Readeck 保存网页的可读内容，供你稍后阅读。它还会检测页面是否为图片或视频，并相应调整其处理流程。

### ⭐ 标签、收藏、归档

将书签移动到归档或收藏中，并添加任意数量的标签。

### 🖍️ 高亮

高亮书签中的重要内容，以便稍后轻松找到。

### 🗃️ 收藏夹

如果你需要一个专门的部分，包含过去 2 周内所有标记为“猫”的书签，Readeck 允许你将此搜索查询保存到收藏夹中，方便你稍后访问。

### 🧩 浏览器扩展

在浏览时想保存一些东西以供稍后查看？无需复制和粘贴链接。安装浏览器扩展，并一键保存书签！

- [适用于 Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/readeck/)
- [适用于 Google Chrome](https://chromewebstore.google.com/detail/readeck/jnmcpmfimecibicbojhopfkcbmkafhee)
- [更多信息和源代码](https://codeberg.org/readeck/browser-extension)

### 📖 电子书导出

有什么比在你的电子阅读器上阅读你收集的文章更好的呢？你可以将任何文章导出为电子书文件（EPUB）。你甚至可以将一个集合导出为一本书！

更重要的是，如果你的电子阅读器支持 OPDS，你可以直接访问 Readeck 的目录和集合。

### 🔎 全文搜索

无论你需要找到文章中的模糊文本，还是所有带有特定标签或来自特定网站的文章，我们都能满足你的需求！

### 🚀 快速！

Readeck 是对所谓无聊但经过验证的技术部分的现代演绎。它保证非常快速的响应时间和流畅的用户体验。

### 🔒 为你的隐私和长期归档而建

你喜欢的这篇文章明年还会在线吗？10 年后呢？也许不会；也许所有内容都消失了，文本和图片都会消失。出于这个原因，以及为了你的隐私，文本和图片在你保存链接的瞬间便存储在你的 Readeck 实例中。

除了视频外，你的浏览器不会向外部网站发出任何请求。

## 安装

1. [将我的 Hass.io 附加组件库][repository] 添加到你的 Hass.io 实例中。
1. 安装此附加组件。
1. 点击 `保存` 按钮以存储你的配置。
1. 启动附加组件。
1. 退出附加组件并重新启动（第一次需要双重启动！）
1. 检查附加组件的日志，查看一切是否顺利。
1. 打开 WebUI 应该可以通过 ingress 或者 <你的-ip>:端口访问。

## 更新
由于源代码没有托管在 github 上，自动更新非常困难。如果想要最新版本，请发布一个问题。

## 配置

```
port : 8000 #你想运行的端口。
```

Webui 可以在 `<你的-ip>:端口` 访问。

[repository]: https://github.com/jdeath/homeassistant-addons