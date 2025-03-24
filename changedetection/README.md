# Home assistant add-on: Changedetection.io

**最好的和最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是 Visualping、Watchtower 等的替代品。旨在简单化 - 主要目标是仅仅免费监控哪些网站发生了文本变更。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格发生变化
- _缺货通知_ 和 _恢复库存通知_
- 政府部门更新（变更常常只在他们的网站上）
- 新软件发布、安全通告，当你不在他们的邮件列表时。
- 节日变化
- 房地产列表变化
- 了解你喜欢的威士忌是否在打折，或其他特殊优惠在别人之前被公布
- 来自主政府网站的COVID相关新闻
- 大学/组织网站的新闻
- 检测和监控 JSON API 响应的变化
- JSON API 监控和警报
- 法律及其他文件的变化
- 当网站上出现文本时，通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 连接在一起
- 根据网页内容的变化创建 RSS 源
- 监控 HTML 源代码以发现意外变化，加强你的 PCI 合规性
- 你有一个非常敏感的 URL 列表需要监视，而你不想使用付费替代品。（记住，_你_ 是产品）

_需要实际支持 Javascript 的 Chrome 运行器吗？我们支持通过 WebDriver 和 Playwright 拉取数据！_

#### 关键特点

- 许多触发过滤器，例如“基于文本触发”、“按选择器移除文本”、“忽略文本”、“提取文本”，也可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂的 JSON，使用 JsonPath 规则
- 在快速的非JavaScript和基于Chrome JavaScript的“拉取器”之间切换
- 轻松指定检查网站的频率
- 在提取文本之前执行 JS（适合登录，参见 UI 中的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 及其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢所有为我的仓库点星的人！要给它点星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关键特点


## 安装

安装此插件非常简单，与安装任何其他 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository] 添加到你的 Hass.io 实例。
1. 安装此插件。
1. 转到 ip:port。Ingress 大致有效，但是页面未正确渲染。


## 如何使用启用 Playwright JS 的拉取器而不是内置的 Plaintext/HTTP 客户端

Changedetection.io 插件本身只能使用内置的 Plaintext/HTTP 客户端拉取网站。

许多现代网页使用 JavaScript 填充内容，它们更具动态性，有时需要真实的 Chrome 浏览器来获取内容，尽管许多页面可能与内置的“拉取器”兼容。

你可以配置 Changedetection.io 使用 Playwright 拉取器来获取页面，否则它将使用内置的非 JavaScript 浏览器进行拉取。使用 Playwright 拉取器提供完整的 Changedetection.io 功能，包括 JS 浏览器步骤以获取内容和可视过滤选择器。

要使用 Playwright 拉取器，Changedetection.io 插件需要与 alexbelgium 制作的无浏览器 Chrome 插件配合使用。

要安装无浏览器 Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库（https://github.com/alexbelgium/hassio-addons/）。从 Homeassistant 界面安装并启动插件。要使用 Playwright 拉取器，只需在添加要监视的新网站时在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或者将其设置为所有监视网站的系统标准，转到你的 Changedetection.io 插件的 Web 界面 > 设置 > 拉取，并选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上的 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1 上进行了测试，但应该与任何其他版本和 amd64 设备正常工作。

注意：无浏览器 Chrome 插件在拉取网站时非常占用资源，无论是在 RAM 还是 CPU 方面。在 RPi 4B 上运行良好，但在旧设备上可能会比较慢。最大并发拉取限制为 1。

[repository]: https://github.com/jdeath/homeassistant-addons