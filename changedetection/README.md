# Home Assistant 插件：Changedetection.io

**最佳且最简单的自托管免费开源网站变更检测跟踪、监控和通知服务。是 Visualping、Watchtower 等的替代品。旨在简化使用——主要目标只是免费监控哪些网站有文本变更。免费开源网页变更检测**

#### 示例用例

- 产品和服务的价格变更
- _缺货通知_ 和 _补货通知_
- 政府部门更新（变更通常只在他们的网站上）
- 新软件发布、安全公告，您未在其邮件列表中时。
- 节日变更
- 房地产上市变更
- 知道您喜欢的威士忌何时打折，或其他特价在其他人之前被宣布
- 来自政府网站的 COVID 相关新闻
- 大学/组织网站的新闻
- 检测和监控 JSON API 响应中的变化
- JSON API 监控和警报
- 法律和其他文件的变更
- 当网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 组合在一起
- 根据网页内容的变更创建 RSS 订阅
- 监控 HTML 源代码以捕捉意外变化，加强您的 PCI 合规性
- 您有非常敏感的 URL 列表需要监视，且您不希望使用付费替代品。（记住，_您_ 是产品）

_需要一个实际的 Chrome 运行器并支持 Javascript 吗？我们支持通过 WebDriver 和 Playwright 获取！</a>_

#### 关键特性

- 大量触发过滤器，例如“基于文本触发”、“按选择器移除文本”、“忽略文本”、“提取文本”，还支持正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂 JSON，使用 JsonPath 规则
- 在快速的非 JS 和基于 Chrome JS 的“获取器”之间切换
- 轻松指定检查网站的频率
- 在提取文本之前执行 JS（适合登录，见用户界面的示例！）
- 重写请求头，指定 `POST` 或 `GET` 及其他方法
- 使用“视觉选择器”帮助定位特定元素

_感谢所有为我的库加星的人！要加星，请点击下方图片，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 关键特性


## 安装

该插件的安装非常简单，与安装其他任何 Hass.io 插件没有区别。

1. [将我的 Hass.io 插件库][repository]添加到您的 Hass.io 实例。
1. 安装该插件。
1. 转到 ip:port。Ingress 有些工作，但页面没有正确呈现


## 如何使用启用 Playwright JS 的获取器而不是内置的纯文本/HTTP 客户端

Changedetection.io 插件本身只能使用内置的纯文本/HTTP 客户端抓取网站。

许多现代网页使用 JavaScript 填充内容，它们更加动态，有时需要真正的 Chrome 浏览器来抓取内容，尽管许多可能可以使用内置的“获取器”工作。

您可以配置 Changedetection.io 使用 Playwright 获取器抓取页面，否则它将使用一个纯粹的非 JS 内置浏览器抓取。使用 Playwright 获取器提供了完整的 Changedetection.io 功能，包括用于抓取内容的 JS 浏览器步骤和视觉过滤选择器。

要使用 Playwright 获取器，Changedetection.io 插件需要与 alexbelgium 制作的 Browserless Chrome 插件配合使用。

要安装 Browserless Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 存储库 (https://github.com/alexbelgium/hassio-addons/)。从 Homeassistant 界面安装并启动该插件。要使用 Playwright 获取器，只需在添加要监控的新网站时，在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或者要将其设置为所有监控网站的系统标准，请转到 Changedetection.io 插件的 Web 界面 > 设置 > 抓取，选择“Playwright Chromium/Javascript”。

有关 Browserless Chrome 插件的更多信息：https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

这两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试于 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1，但应与任何其他版本和 amd64 设备兼容。

注意：Browserless Chrome 插件在抓取网站时非常占用资源，无论是 RAM 还是 CPU。RPi 4B 上表现良好，在较旧设备上可能较慢。最大并发抓取数量限制为 1。


[repository]: https://github.com/jdeath/homeassistant-addons