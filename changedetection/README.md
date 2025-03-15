# Home assistant 插件: Changedetection.io

**最佳和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。Visualping、Watchtower 等的替代方案。旨在简单 - 主要目标是仅监控哪些网站发生了文本更改，且是免费的。免费开源网页变更检测。**

#### 示例用例

- 产品和服务价格变动
- _缺货通知_ 和 _重新有货通知_
- 政府部门更新（变更通常仅在他们的网站上）
- 新软件发布、安全公告当你不在他们的邮件列表时。
- 节日变动
- 房地产列表变动
- 知道你最喜欢的威士忌何时打折，或其他特殊优惠在其他人之前宣布
- 来自政府网站的 COVID 相关新闻
- 大学/组织网站上的新闻
- 检测和监控 JSON API 响应中的变更 
- JSON API 监控和警报
- 法律和其他文件的变更
- 当网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 组合在一起
- 根据网页内容的变更创建 RSS 源
- 监控 HTML 源代码以发现意外变更，加强你的 PCI 合规性
- 你有一份非常敏感的 URL 列表需要监视，并且你不想使用付费替代方案。（记住，_你_ 是产品）

_需要实际支持 Javascript 的 Chrome 运行器吗？我们支持通过 WebDriver 和 Playwright 获取页面！_

#### 主要特性

- 许多触发过滤器，例如“基于文本触发”、“通过选择器移除文本”、“忽略文本”、“提取文本”，还可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂 JSON，使用 JsonPath 规则
- 在快速的非 JavaScript 和基于 Chrome 的 JavaScript “抓取器”之间切换
- 轻松指定网站检查的频率
- 提取文本前执行 JavaScript（适用于登录，参见 UI 中的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 和其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后它会出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特性


## 安装

此插件的安装非常简单，与安装其他任何 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件仓库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 访问 ip:port 。Ingress 大致有效，但页面没有正确渲染。


## 如何使用启用 Playwright JS 的抓取器，而不是内置的纯文本/HTTP 客户端

Changedetection.io 插件本身只能使用内置的纯文本/HTTP 客户端抓取网站。

许多现代网页使用 JavaScript 填充内容，它们更具动态性，有时需要真正的 Chrome 浏览器来抓取内容，尽管许多页面可以与内置的“抓取器”一起工作。

你可以配置 Changedetection.io 使用 Playwright 抓取器抓取页面，否则它将使用内置的非 JS 浏览器进行抓取。使用 Playwright 抓取器提供了完整的 Changedetection.io 功能，包括 JS 浏览器步骤来抓取内容和可视过滤器选择器。

要使用 Playwright 抓取器，Changedetection.io 插件需要与由 alexbelgium 制作的无浏览器 Chrome 插件协同工作。

要安装无浏览器 Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库（https://github.com/alexbelgium/hassio-addons/）。从 Homeassistant 界面安装并启动该插件。要使用 Playwright 抓取器，只需在添加要监视的新站点时在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或将其设置为所有监视站点的系统标准，前往你的 Changedetection.io 插件的 Web 界面 > 设置 > 抓取，并选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试了 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1，但应该适用于任何其他版本及 amd64 设备。

注意：无浏览器 Chrome 插件在抓取网站时非常占用资源，无论是 RAM 还是 CPU。在 RPi 4B 上运行良好，在较旧的设备上可能会变慢。最大同时抓取数限制为 1。


[repository]: https://github.com/jdeath/homeassistant-addons