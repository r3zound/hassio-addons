# Home assistant 插件：Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是 Visualping、Watchtower 等的替代品。设计简洁 - 主要目标是简单地免费监控哪些网站有文本变更。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格发生变化
- _缺货通知_ 和 _再库通知_
- 政府部门更新（变更通常仅在其网站上）
- 新软件发布、安全通告，当您不在其邮件列表中时。
- 节日更改
- 房地产列表变更
- 知道您喜爱的威士忌何时打折，或其他特别优惠在其他人之前公布
- 政府网站上的 COVID 相关新闻
- 大学/组织的新闻来自他们的网站
- 检测和监控 JSON API 响应中的变化
- JSON API 监控和警报
- 法律和其他文件的变更
- 在网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 连接在一起
- 基于网页内容的变化创建 RSS 源
- 监控 HTML 源代码的意外变化，加强您的 PCI 合规性
- 您有一份非常敏感的 URL 列表需要监视，而您不想使用付费替代品。（记住，_您_ 是产品）

_需要实际支持 JavaScript 的 Chrome 运行器吗？我们支持通过 WebDriver 和 Playwright 获取！</a>_

#### 主要特点

- 很多触发器过滤器，例如“基于文本触发”、“通过选择器移除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂的 JSON，使用 JsonPath 规则
- 在快速的非 JS 和 Chrome JS 基于“获取器”之间切换
- 轻松指定网站检查的频率
- 提取文本前执行 JS（适合登录，请参阅 UI 中的示例！）
- 以覆盖请求头，指定 `POST` 或 `GET` 及其他方法
- 使用“视觉选择器”帮助定位特定元素

_感谢所有为我的仓库点赞的人！若要点赞，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特点

## 安装

该插件的安装非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件仓库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 转到 ip:port。Ingress 似乎工作，但页面无法正确渲染。

## 如何使用启用 Playwright JS 的获取器代替内置的纯文本/HTTP 客户端

Changedetection.io 插件本身只能使用内置的纯文本/HTTP 客户端获取网站。

许多现代网页使用 JavaScript 填充内容，它们更加动态，有时需要真实的 Chrome 浏览器来获取内容，尽管许多网页可能在内置的“获取器”下工作。

您可以配置 Changedetection.io 使用 Playwright 获取器来获取页面，否则它将使用普通非 JS 内置浏览器获取。使用 Playwright 获取器提供完整的 Changedetection.io 功能，包括 JS 浏览器步骤来获取内容和视觉过滤选择器。

要使用 Playwright 获取器，Changedetection.io 插件需要与由 alexbelgium 制作的无浏览器 Chrome 插件合作。

要安装无浏览器 Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库（https://github.com/alexbelgium/hassio-addons/）。从 Homeassistant 界面安装并启动插件。要使用 Playwright 获取器，只需在添加要监控的新站点时在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或者将其设置为所有监控站点的系统标准，转到您的 Changedetection.io 插件的 Web 界面 > 设置 > 获取，然后选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试的 Home Assistant 2023.5.3/Supervisor 2023.04.1/操作系统 10.1，但应该可以在任何其他版本和 amd64 设备上工作。

注意：无浏览器 Chrome 插件在获取网站时相当耗费资源，无论是 RAM 还是 CPU。它在 RPi 4B 上工作良好，但在较旧的设备上可能会变慢。最大同时获取限制为 1。

[repository]: https://github.com/jdeath/homeassistant-addons