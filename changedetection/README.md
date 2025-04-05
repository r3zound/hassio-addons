# Home assistant add-on: Changedetection.io

**最好的最简单的自托管免费开源网站变化检测跟踪、监控和通知服务。 Visualping、Watchtower 等的替代方案。旨在简单性 - 主要目标就是仅仅监控哪些网站发生了文本变化是免费的。免费开源网页变化检测**

#### 示例用例

- 产品和服务的定价发生变化
- _缺货通知_ 和 _补货通知_
- 政府部门更新（变更通常仅在他们的网站上）
- 新软件发布，安全通告当您不在他们的邮件列表中时。
- 节日变化
- 房地产列表变化
- 知道您最喜欢的威士忌何时特价，或其他特别交易宣布之前出现
- 从政府网站获取与COVID相关的新闻
- 大学/组织新闻来自他们的网站
- 检测和监控 JSON API 响应中的变化
- JSON API 监控和报警
- 法律文档和其他文件的变化
- 当网站上出现文本时通过通知触发 API 调用
- 使用 JSON 过滤器和 JSON 通知将 API 连接在一起
- 根据网页内容的变化创建 RSS 源
- 监控 HTML 源代码以检测意外变化，加强 PCI 合规性
- 您有非常敏感的 URL 列表需要监控，而您 _不_ 想使用付费替代方案。（记住，_您_ 是产品）

_需要实际的支持 JavaScript 的 Chrome 运行器吗？我们支持通过 WebDriver 和 Playwright 进行获取！_

#### 主要特点

- 提供许多触发过滤器，例如“根据文本触发”、“按选择器移除文本”、“忽略文本”、“提取文本”，也可以使用正则表达式！
- 使用 xPath 和 CSS 选择器定位元素，轻松监控复杂 JSON，使用 JsonPath 规则
- 在快速非 JavaScript 和基于 Chrome JavaScript 的“获取器”之间切换
- 轻松指定网站检查的频率
- 在提取文本之前执行 JavaScript（适合登录，参见 UI 中的示例！）
- 覆盖请求头，指定 `POST` 或 `GET` 和其他方法
- 使用“可视选择器”帮助定位特定元素

_感谢每一个给我的仓库加星的人！要加星，请单击下面的图像，然后它将在右上方显示。谢谢！_

[![Stargazers repo roster for @jdeath/homeassistant-addons](https://reporoster.com/stars/jdeath/homeassistant-addons)](https://github.com/jdeath/homeassistant-addons/stargazers)

## 主要特点


## 安装

该插件的安装非常简单，并与安装任何其他 Hass.io 插件没有不同。

1. [将我的 Hass.io 插件库][repository] 添加到您的 Hass.io 实例。
1. 安装此插件。
1. 转到 ip:port。 Ingress 可以正常工作，但页面不能正确渲染


## 如何使用启用 Playwright JS 的获取器代替内置的 Plaintext/HTTP 客户端

Changedetection.io 插件本身只能使用内置的 Plaintext/HTTP 客户端获取网站。

许多现代网页使用 JavaScript 填充内容，它们更具动态性，有时需要真实的 Chrome 浏览器来获取内容，尽管许多可能会与内置的“获取器”一起工作。

您可以配置 Changedetection.io 以使用 Playwright 获取页面，否则它将使用普通的非 JavaScript 内置浏览器进行获取。使用 Playwright 获取器提供完整的 Changedetection.io 功能，包括获取内容的 JavaScript 浏览器步骤和可视过滤选择器。

要使用 Playwright 获取器，Changedetection.io 插件需要与 alexbelgium 制作的无浏览器 Chrome 插件协作。

要安装无浏览器 Chrome 插件，请在 Homeassistant 中添加 alexbelgium/hassio-addons 仓库（https://github.com/alexbelgium/hassio-addons/）。从 Homeassistant 界面安装并启动该插件。要使用 Playwright 获取器，只需在添加要监控的新网站时在“请求”选项卡中勾选“Playwright Chromium/Javascript”，或将其设置为所有监控网站的系统标准，转到您的 Changedetection.io 插件的 Web 界面 > 设置 > 获取，然后选择“Playwright Chromium/Javascript”。

有关无浏览器 Chrome 插件的更多信息： https://github.com/alexbelgium/hassio-addons/tree/master/browserless_chrome

这两个插件需要在同一台机器上运行。在 Raspberry Pi 4B 上测试通过 Home Assistant 2023.5.3/Supervisor 2023.04.1/Operating System 10.1，但应该与任何其他版本及 amd64 设备一起使用。

注意：无浏览器 Chrome 插件在获取网站时相当占用资源，RAM 和 CPU 方面。 在 RPi 4B 上运行良好，但在旧设备上可能速度较慢。最大并行获取限制为 1。


[repository]: https://github.com/jdeath/homeassistant-addons